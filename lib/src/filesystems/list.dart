import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/create.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/platform/colors.dart';
import 'package:lambda_gui/src/platform/icon_button.dart';
import 'package:lambda_gui/src/platform/icons.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class FilesystemsList extends StatelessWidget {
  final _repository = FilesystemsRepository.instance;

  FilesystemsList({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_repository.update());

    final theme = Theme.of(context);
    final themeType = ThemeTypeProvider.of(context);
    TextStyle? titleStyle;
    if (themeType == ThemeType.lambda) {
      // It would be nice to do this in the theme. Unfortunately, setting inverted colours in the TextTheme only sets the background colour, and setting a TextTheme in the AppBarTheme results in the wrong text size in one of regular or large app bars. Doing it onesey-twosey is easiest. TODO: factor this into a component.
      titleStyle = TextStyle(
          color: theme.colorScheme.onInverseSurface,
          backgroundColor: theme.colorScheme.inverseSurface);
    }

    final scrollView = CustomScrollView(slivers: [
      PlatformTopBarSliver(
        title: Text(
          'Filesystems',
          style: titleStyle,
        ),
        action: PlatformIconButton(
          onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
              title: 'Filesystem',
              fullscreenDialog: true,
              builder: (context) => CreateFilesystemPage())),
          icon: Icon(CupertinoIcons.add_circled),
        ),
      ),
      if (themeType == ThemeType.cupertino) CupertinoActivityIndicator(),
      StreamBuilder(
        initialData: _repository.filesystems,
        stream: _repository.stream,
        builder: (context, snapshot) {
          final error = snapshot.error;
          if (error != null) {
            // TODO: log to server to determine how best to present common errors.
            return SliverFillRemaining(
              child: Column(children: [
                Text('Error: $error'),
                Text('Pull to refresh'),
              ]),
            );
          }

          final data = snapshot.data;
          if (data == null) {
            return SliverFillRemaining(
              child: Center(
                child: PlatformCircularProgressIndicator(),
              ),
            );
          }

          return SliverList.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ValueKey(data[index].id),
                confirmDismiss: (direction) {
                  if (themeType == ThemeType.cupertino) {
                    return showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: Text(data[index].name),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () => context.pop(true),
                            isDestructiveAction: true,
                            child: Text('Delete'),
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
                          title: Text(data[index].name),
                          children: [
                            SimpleDialogOption(
                              onPressed: () => context.pop(true),
                              child: Text('Delete'),
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
                onDismissed: (direction) =>
                    _repository.delete(id: data[index].id),
                background: Container(
                  color: PlatformColors.destructive(themeType),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Icon(
                    PlatformIcons.delete(themeType),
                    color: Colors.white,
                  ),
                ),
                secondaryBackground: Container(
                  color: PlatformColors.destructive(themeType),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Icon(
                    PlatformIcons.delete(themeType),
                    color: Colors.white,
                  ),
                ),
                child: PlatformListTile(title: Text(data[index].name)),
              );
            },
          );
        },
      ),
    ]);

    if (themeType == ThemeType.material || themeType == ThemeType.lambda) {
      return RefreshIndicator(
        onRefresh: () => _repository.update(force: true),
        child: scrollView,
      );
    } else {
      return scrollView;
    }
  }
}
