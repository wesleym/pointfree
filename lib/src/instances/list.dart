import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/instances/launch.dart';
import 'package:pointfree/src/instances/repository.dart';
import 'package:pointfree/src/platform/circular_progress_indicator.dart';
import 'package:pointfree/src/platform/icon_button.dart';
import 'package:pointfree/src/platform/icons.dart';
import 'package:pointfree/src/platform/list_tile.dart';
import 'package:pointfree/src/platform/top_bar_sliver.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class InstancesList extends StatelessWidget {
  final _repository = InstancesRepository.instance;

  InstancesList({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_repository.update());

    final theme = Theme.of(context);
    final themeType = ThemeTypeProvider.of(context).themeType;
    TextStyle? titleStyle;
    if (themeType == ThemeType.lambda) {
      // It would be nice to do this in the theme. Unfortunately, setting inverted colours in the TextTheme only sets the background colour, and setting a TextTheme in the AppBarTheme results in the wrong text size in one of regular or large app bars. Doing it onesey-twosey is easiest. TODO: factor this into a component.
      titleStyle = TextStyle(
          color: theme.colorScheme.onInverseSurface,
          backgroundColor: theme.colorScheme.inverseSurface);
    }

    return StreamBuilder(
      initialData: _repository.instances,
      stream: _repository.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // TODO: Error handling.
          return Center(child: PlatformCircularProgressIndicator());
        }

        final data = snapshot.data!;
        var scrollView = CustomScrollView(
          slivers: [
            PlatformTopBarSliver(
              title: Text(
                'GPU Instances',
                style: titleStyle,
              ),
              action: PlatformIconButton(
                onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                    title: 'Launch',
                    fullscreenDialog: true,
                    builder: (context) => LaunchInstancePage())),
                icon: Icon(PlatformIcons.add(themeType)),
              ),
            ),
            if (themeType == ThemeType.cupertino)
              CupertinoSliverRefreshControl(),
            SliverList.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  onDismissed: (direction) =>
                      _repository.terminate(data[index].id),
                  key: ValueKey(data[index].id),
                  confirmDismiss: (direction) {
                    if (themeType == ThemeType.cupertino) {
                      return showCupertinoModalPopup(
                        context: context,
                        builder: (context) => CupertinoActionSheet(
                          title: Text('Terminate instance'),
                          actions: [
                            CupertinoActionSheetAction(
                              onPressed: () => context.pop(true),
                              isDestructiveAction: true,
                              child: Text('Terminate'),
                            ),
                          ],
                          cancelButton: CupertinoActionSheetAction(
                            onPressed: () => context.pop(false),
                            child: Text('Cancel'),
                          ),
                        ),
                      );
                    } else {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            title: Text('Terminate instance'),
                            children: [
                              SimpleDialogOption(
                                onPressed: () => context.pop(true),
                                child: Text('Terminate'),
                              ),
                              SimpleDialogOption(
                                onPressed: () => context.pop(false),
                                child: Text('Cancel'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: PlatformListTile(
                      onTap: () => context.go('/instance/${data[index].id}'),
                      title: Text(data[index].name ?? data[index].id)),
                );
              },
            ),
          ],
        );

        if (themeType == ThemeType.cupertino) {
          return scrollView;
        } else {
          return RefreshIndicator(
            onRefresh: () => _repository.update(force: true),
            child: scrollView,
          );
        }
      },
    );
  }
}
