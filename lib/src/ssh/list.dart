import 'dart:async';

import 'package:flutter/material.dart';
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
        if (!snapshot.hasData) {
          // TODO: Error handling.
          return Center(child: CircularProgressIndicator.adaptive());
        }

        final data = snapshot.data!;
        return RefreshIndicator.adaptive(
          onRefresh: () => _repository.update(force: true),
          child: CustomScrollView(
            slivers: [
              PlatformTopBarSliver(
                  title: Text(
                'SSH',
                style: titleStyle,
              )),
              SliverList.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    onDismissed: (direction) =>
                        _repository.delete(data[index].id),
                    key: ValueKey(data[index].id),
                    child: PlatformListTile(title: Text(data[index].name)),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
