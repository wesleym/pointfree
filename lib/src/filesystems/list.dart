import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/filesystems/create.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/platform/app.dart';
import 'package:lambda_gui/src/platform/colors.dart';
import 'package:lambda_gui/src/platform/icon_button.dart';
import 'package:lambda_gui/src/platform/icons.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';

class FilesystemsList extends StatelessWidget {
  final _repository = FilesystemsRepository.instance;

  FilesystemsList({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_repository.update());

    final theme = Theme.of(context);
    final themeType = resolveThemeType(themeOverride, theme.platform);
    TextStyle? titleStyle;
    if (themeType == ThemeType.lambda) {
      // It would be nice to do this in the theme. Unfortunately, setting inverted colours in the TextTheme only sets the background colour, and setting a TextTheme in the AppBarTheme results in the wrong text size in one of regular or large app bars. Doing it onesey-twosey is easiest. TODO: factor this into a component.
      titleStyle = TextStyle(
          color: theme.colorScheme.onInverseSurface,
          backgroundColor: theme.colorScheme.inverseSurface);
    }

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
      ],
      body: StreamBuilder(
        initialData: _repository.filesystems,
        stream: _repository.stream,
        builder: (context, snapshot) {
          final Widget body;
          if (snapshot.hasData) {
            final data = snapshot.data!;
            body = ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                var platform = Theme.of(context).platform;
                return Dismissible(
                  key: ValueKey(data[index].id),
                  onDismissed: (direction) =>
                      // TODO: Confirmation
                      _repository.delete(id: data[index].id),
                  background: Container(
                    color: PlatformColors.destructive(platform),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Icon(PlatformIcons.delete(platform),
                        color: Colors.white),
                  ),
                  secondaryBackground: Container(
                    color: PlatformColors.destructive(platform),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Icon(PlatformIcons.delete(platform),
                        color: Colors.white),
                  ),
                  child: PlatformListTile(title: Text(data[index].name)),
                );
              },
            );
          } else {
            // TODO: Error handling.
            body = SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: CircularProgressIndicator.adaptive());
          }

          return RefreshIndicator.adaptive(
              onRefresh: () => _repository.update(force: true), child: body);
        },
      ),
    );
  }
}
