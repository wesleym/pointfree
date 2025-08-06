import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class SshKeysList extends StatelessWidget {
  final _repository = SshKeysRepository.instance;

  SshKeysList({super.key});

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

    return StreamBuilder(
      initialData: _repository.sshKeys,
      stream: _repository.stream,
      builder: (context, snapshot) {
        final error = snapshot.error;
        if (error != null) {
          // TODO: log to server to determine how best to present common errors.
          return Center(
            child: Column(children: [
              Text('Error: $error'),
              FilledButton(
                onPressed: () => _repository.update(force: true),
                child: Text('Reload'),
              ),
            ]),
          );
        }

        final data = snapshot.data;
        if (data == null) {
          return Center(child: PlatformCircularProgressIndicator());
        }

        final scrollView = CustomScrollView(slivers: [
          PlatformTopBarSliver(title: Text('SSH', style: titleStyle)),
          if (themeType == ThemeType.cupertino) CupertinoSliverRefreshControl(),
          SliverList.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) => Dismissible(
              onDismissed: (direction) => _repository.delete(data[index].id),
              key: ValueKey(data[index].id),
              child: PlatformListTile(title: Text(data[index].name)),
            ),
          ),
        ]);

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
