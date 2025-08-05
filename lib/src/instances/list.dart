import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/instances/launch.dart';
import 'package:lambda_gui/src/instances/repository.dart';
import 'package:lambda_gui/src/platform/icon_button.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class InstancesList extends StatelessWidget {
  final _repository = InstancesRepository.instance;

  InstancesList({super.key});

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
      initialData: _repository.instances,
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
              // TODO: Make platform icons.
              PlatformTopBarSliver(
                title: Text(
                  'GPU Instances',
                  style: titleStyle,
                ),
                action: PlatformIconButton(
                  onPressed: () => Navigator.of(context).push(
                      CupertinoPageRoute(
                          title: 'Launch',
                          fullscreenDialog: true,
                          builder: (context) => LaunchInstancePage())),
                  icon: Icon(CupertinoIcons.add_circled),
                ),
              ),
              SliverList.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    onDismissed: (direction) =>
                        _repository.terminate(data[index].id),
                    key: ValueKey(data[index].id),
                    child: PlatformListTile(
                        onTap: () => context.go('/instance/${data[index].id}'),
                        title: Text(data[index].name ?? data[index].id)),
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
