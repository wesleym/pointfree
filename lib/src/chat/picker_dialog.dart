import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/chat/store.dart';

class ConversationPickerDialog extends StatelessWidget {
  final _store = Store.instance;

  ConversationPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Conversation'),
      children: [
        SimpleDialogOption(
            onPressed: () {
              final conversation = _store.createConversation();
              context.pop(conversation.id);
            },
            child: Text('New conversation')),
        for (final c in _store.conversations.asMap().entries)
          SimpleDialogOption(
            onPressed: () => context.pop(c.key),
            // TODO: get conversation titles
            child: Text('Conversation ${c.value.id}'),
          ),
      ],
    );
  }
}
