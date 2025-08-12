import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:pointfree/src/chat/messages.dart';
import 'package:pointfree/src/chat/picker_dialog.dart';
import 'package:pointfree/src/chat/picker_page.dart';
import 'package:pointfree/src/chat/store.dart';
import 'package:pointfree/src/platform/icon_button.dart';
import 'package:pointfree/src/platform/icons.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/platform/text_button.dart';
import 'package:pointfree/src/platform/text_field.dart';
import 'package:pointfree/src/secrets.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _chatController = TextEditingController();
  final _conversationController = ScrollController();
  final _store = Store.instance;
  var _inProgress = false;
  var _activeConversationId = 0;
  Conversation? get _conversation =>
      _store.getConversation(_activeConversationId);

  void _sendMessage(String value) async {
    final conversation = _conversation;
    if (conversation == null) return;
    if (value.trim().isEmpty) return;
    _chatController.clear();

    conversation.addMessage(Message(MessageType.user, value));

    setState(() {
      _inProgress = true;
    });
    final sseStream = SSEClient.subscribeToSSE(
      method: SSERequestType.POST,
      url: 'https://api.lambda.ai/v1/chat/completions',
      header: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: conversation.toJson(),
    );
    var role = MessageType.assistant;
    final chunkController = StreamController<String>.broadcast();
    final message = AppendableMessage(role, chunkController.stream);
    conversation.addMessage(message);

    var first = true;
    await for (final event in sseStream) {
      if (first) {
        setState(() {
          _inProgress = false;
        });
        role =
            switch (json.decode(event.data!)['choices'][0]['delta']['role']) {
          'system' => MessageType.system,
          'assistant' => MessageType.assistant,
          'user' => MessageType.user,
          _ => MessageType.assistant,
        };
        first = false;
      }

      if (event.data?.trim() == '[DONE]') {
        chunkController.close();
        break;
      }

      final chunkMap = json.decode(event.data!);
      final choice = (chunkMap['choices'] as List).first;
      // TODO: handle refusal
      final content = choice['delta']['content'] as String?;
      if (content != null) {
        chunkController.add(content);
      }
    }
  }

  Future<void> _handleChooseConversation(ThemeType themeType) async {
    if (!mounted) return;
    final int? conversationId = switch (themeType) {
      ThemeType.cupertino =>
        await Navigator.of(context).push(CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (context) => ConversationPickerPage(),
        )),
      ThemeType.material || ThemeType.lambda => await showDialog(
          context: context,
          builder: (context) => ConversationPickerDialog(),
        )
    };
    if (conversationId != null) {
      _chatController.clear();
      setState(() {
        _activeConversationId = conversationId;
        _inProgress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;

    assert(_conversation != null);
    final conversation = _conversation!;

    return PlatformScaffold(
      topBar: PlatformTopBar(
        title: const Text('Lambda Chat'),
        action: PlatformIconButton(
          onPressed: () => _handleChooseConversation(themeType),
          icon: Icon(PlatformIcons.conversations(themeType)),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 16),
        child: Column(children: [
          Expanded(
            child: StreamBuilder(
                key: ValueKey(conversation.id),
                initialData: conversation.displayMessages,
                stream: conversation.displayMessageStream,
                builder: (context, snapshot) {
                  final messages = snapshot.data!;
                  if (messages.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Examples'),
                        const SizedBox(height: 8),
                        PlatformTextButton(
                            onPressed: () =>
                                _sendMessage('What does JSON look like?'),
                            child: const Text('What does JSON look like?'))
                      ],
                    );
                  }
                  return Align(
                    alignment: Alignment.topCenter,
                    child: StreamBuilder(
                        initialData: conversation.displayMessages,
                        stream: conversation.displayMessageStream,
                        builder: (context, snapshot) {
                          final messages = snapshot.data!;
                          return ListView.builder(
                            reverse: true,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            controller: _conversationController,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              final message =
                                  messages[messages.length - index - 1];

                              return switch (message.messageType) {
                                MessageType.user =>
                                  UserMessageWidget(message: message),
                                MessageType.assistant => AssistantMessageWidget(
                                    message: message,
                                    onContentUpdated: _scrollToBottom,
                                  ),
                                _ => throw UnimplementedError(),
                              };
                            },
                          );
                        }),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: PlatformTextField(
              controller: _chatController,
              onSubmitted: _sendMessage,
              enabled: !_inProgress,
            ),
          ),
        ]),
      ),
    );
  }

  void _scrollToBottom() {
    if (!_conversationController.hasClients ||
        !_conversationController.positions.isNotEmpty ||
        !_conversationController.position.hasContentDimensions) {
      return;
    }

    _conversationController.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }
}
