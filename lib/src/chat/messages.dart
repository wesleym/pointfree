import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:lambda_gui/src/chat/store.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.assistant),
        ),
        Expanded(
          child: Card(
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
                      code: const TextStyle(
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MarkdownBody(
                data: message.content,
                styleSheet: MarkdownStyleSheet(
                  code: const TextStyle(
                    fontFamily: 'monospace',
                    fontFamilyFallback: ['Menlo'],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.person),
        ),
      ],
    );
  }
}
