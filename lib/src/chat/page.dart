import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:lambda_gui/src/chat/messages.dart';
import 'package:lambda_gui/src/chat/store.dart';
import 'package:lambda_gui/src/platform/icon_button.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/text_button.dart';
import 'package:lambda_gui/src/platform/text_field.dart';
import 'package:lambda_gui/src/secrets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _chatController = TextEditingController();
  final _conversationController = ScrollController();
  var _conversation = store.conversations[0];
  var _inProgress = false;

  void _sendMessage(String value) async {
    if (value.trim().isEmpty) return;
    _chatController.clear();

    _conversation.addMessage(Message(MessageType.user, value));

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
      body: _conversation.toJson(),
    );
    var role = MessageType.assistant;
    final chunkController = StreamController<String>.broadcast();
    final message = AppendableMessage(role, chunkController.stream);
    _conversation.addMessage(message);

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

  void _newConversation() {
    final conversation = store.createConversation();
    store.conversations.add(conversation);
    _chatController.clear();
    setState(() {
      _conversation = conversation;
      _inProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    IconData? iconData;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        iconData = CupertinoIcons.trash_circle;
        break;
      default:
        iconData = Icons.delete_sweep;
        break;
    }
    return PlatformScaffold(
      topBar: PlatformTopBar(
        title: const Text('Lambda Chat'),
        action: PlatformIconButton(
          onPressed: _newConversation,
          icon: Icon(iconData),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 16),
        child: Column(children: [
          Expanded(
            child: StreamBuilder(
                key: ValueKey(_conversation.id),
                initialData: _conversation.displayMessages,
                stream: _conversation.displayMessageStream,
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
                        initialData: _conversation.displayMessages,
                        stream: _conversation.displayMessageStream,
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
