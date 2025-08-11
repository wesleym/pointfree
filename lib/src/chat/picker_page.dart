import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/chat/store.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';

class ConversationPickerPage extends StatelessWidget {
  final _store = Store.instance;

  ConversationPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Conversation'),
        ),
        child: CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(),
            SliverToBoxAdapter(
              child: PlatformListTile(
                onTap: () {
                  final convo = _store.createConversation();
                  context.pop(convo.id);
                },
                title: Text('New conversation'),
              ),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                return PlatformListTile(
                  onTap: () => context.pop(index),
                  // TODO: get conversation titles
                  title: Text('Conversation ${_store.conversations[index].id}'),
                );
              },
            ),
          ],
        ));
  }
}
