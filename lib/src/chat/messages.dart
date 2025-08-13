import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:pointfree/src/chat/chat_bubble.dart';
import 'package:pointfree/src/chat/store.dart';
import 'package:pointfree/src/platform/icons.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class AssistantMessageWidget extends StatefulWidget {
  const AssistantMessageWidget({
    super.key,
    required this.message,
    required void Function() onContentUpdated,
  }) : _onContentUpdated = onContentUpdated;

  final DisplayableMessage message;
  final void Function() _onContentUpdated;

  @override
  State<AssistantMessageWidget> createState() => _AssistantMessageWidgetState();
}

class _AssistantMessageWidgetState extends State<AssistantMessageWidget> {
  var _lastContent = '';

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(PlatformIcons.assistant(themeType)),
        ),
        Expanded(
          child: PlatformChatBubble(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                initialData: widget.message.content,
                stream: widget.message.contentStream,
                builder: (context, snapshot) {
                  final content = snapshot.data!;
                  if (content != _lastContent) {
                    _lastContent = content;
                    widget._onContentUpdated();
                  }

                  return MarkdownBody(
                    data: content,
                    styleSheet: MarkdownStyleSheet(
                      p: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      code: TextStyle(
                        fontFamily: 'monospace',
                        fontFamilyFallback: ['Menlo'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserMessageWidget extends StatelessWidget {
  const UserMessageWidget({
    super.key,
    required this.message,
  });

  final DisplayableMessage message;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: PlatformChatBubble(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MarkdownBody(
                data: message.content,
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  code: TextStyle(
                    fontFamily: 'monospace',
                    fontFamilyFallback: ['Menlo'],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(PlatformIcons.person(themeType)),
        ),
      ],
    );
  }
}
