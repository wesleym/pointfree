import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointfree/src/firewall/create.dart';
import 'package:pointfree/src/firewall/list.dart';
import 'package:pointfree/src/platform/icons.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class FirewallPage extends StatelessWidget {
  const FirewallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context);

    return PlatformScaffold(
      primaryActionIcon: Icon(PlatformIcons.add(themeType)),
      onPrimaryActionSelected: () => _onCreateFirewallRule(context),
      body: FirewallList(),
    );
  }

  void _onCreateFirewallRule(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context);
    switch (themeType) {
      case ThemeType.cupertino:
        Navigator.of(context).push(CupertinoPageRoute(
          title: 'Firewall',
          fullscreenDialog: true,
          builder: (context) => CreateFirewallRulePage(),
        ));
      case ThemeType.material:
      case ThemeType.lambda:
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => CreateFirewallRulePage(),
          ),
        );
    }
  }
}
