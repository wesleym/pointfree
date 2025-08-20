import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/chat/store.dart';
import 'package:pointfree/src/platform/list_tile.dart';

class ConversationPickerPage extends StatelessWidget {
  final _store = Store.instance;

  ConversationPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(),
            // TODO: can this be two separate lists?
            SliverList.builder(
              itemCount: _store.conversations.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return PlatformListTile(
                    onTap: () {
                      final convo = _store.createConversation();
                      context.pop(convo.id);
                    },
                    title: Text('New conversation'),
                  );
                } else {
                  return PlatformListTile(
                    onTap: () => context.pop(index),
                    // TODO: get conversation titles
                    title: Text(
                      'Conversation ${_store.conversations[index - 1].id}',
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
