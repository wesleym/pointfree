import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/chat/store.dart';

class ConversationPickerDialog extends StatelessWidget {
  final _store = Store.instance;

  ConversationPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: _store.conversations,
        stream: _store.conversationStream,
        builder: (context, snapshot) {
          final error = snapshot.error;
          assert(error == null);

          final data = snapshot.data;
          if (data == null) {
            return _createDialog(context: context, children: [
              CircularProgressIndicator(),
            ]);
          }

          return _createDialog(context: context, children: [
            SimpleDialogOption(
              onPressed: () {
                final conversation = _store.createConversation();
                context.pop(conversation.id);
              },
              child: Text('New conversation'),
            ),
            for (final c in _store.conversations)
              SimpleDialogOption(
                onPressed: () => context.pop(c.id),
                // TODO: get conversation titles
                child: Text('Conversation ${c.id}'),
              ),
          ]);
        });
  }

  SimpleDialog _createDialog(
          {required BuildContext context, required List<Widget> children}) =>
      SimpleDialog(title: Text('Conversation'), children: children);
}
