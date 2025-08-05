import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/firewall/create.dart';
import 'package:lambda_gui/src/firewall/repository.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/platform/colors.dart';
import 'package:lambda_gui/src/platform/icon_button.dart';
import 'package:lambda_gui/src/platform/icons.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class FirewallList extends StatelessWidget {
  final _repository = FirewallRepository.instance;

  FirewallList({super.key});

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

    var scrollView =
        CustomScrollView(physics: AlwaysScrollableScrollPhysics(), slivers: [
      PlatformTopBarSliver(
        title: Text(
          'Firewall',
          style: titleStyle,
        ),
        action: PlatformIconButton(
          onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
              title: 'Firewall',
              fullscreenDialog: true,
              builder: (context) => CreateFirewallRulePage())),
          icon: Icon(CupertinoIcons.add_circled),
        ),
      ),
      if (themeType == ThemeType.cupertino) CupertinoSliverRefreshControl(),
      StreamBuilder(
        initialData: _repository.firewallRules,
        stream: _repository.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return SliverList.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final String portRangeString;
                if (data[index].portRange[0] == data[index].portRange[1]) {
                  portRangeString = '${data[index].portRange[0]}';
                } else {
                  portRangeString =
                      '${data[index].portRange[0]}–${data[index].portRange[1]}';
                }
                return Dismissible(
                  background: Container(
                    color: PlatformColors.destructive(themeType),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      PlatformIcons.delete(themeType),
                      color: Colors.white,
                    ),
                  ),
                  secondaryBackground: Container(
                    color: PlatformColors.destructive(themeType),
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(
                      PlatformIcons.delete(themeType),
                      color: Colors.white,
                    ),
                  ),
                  key: ValueKey(
                      '${data[index].protocol} ${data[index].sourceNetwork} $portRangeString'),
                  onDismissed: (direction) {
                    final firewallRules = snapshot.data!;
                    firewallRules.removeAt(index);
                    _repository.replace(firewallRules);
                  },
                  child: PlatformListTile(
                    title: Text(
                        '${data[index].protocol} ${data[index].sourceNetwork} $portRangeString'),
                    subtitle: Text(data[index].description),
                  ),
                );
              },
            );
          } else {
            // TODO: Error handling.
            return SliverFillViewport(
              delegate: SliverChildListDelegate.fixed(
                  [PlatformCircularProgressIndicator()]),
            );
          }
        },
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
  }
}
