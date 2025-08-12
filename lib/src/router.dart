import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/filesystems/page.dart';
import 'package:pointfree/src/firewall/page.dart';
import 'package:pointfree/src/home.dart';
import 'package:pointfree/src/instances/page.dart';
import 'package:pointfree/src/login/page.dart';
import 'package:pointfree/src/login/store.dart';
import 'package:pointfree/src/ssh/page.dart';
import 'package:pointfree/src/theme_type_provider.dart';

// GoRouter configuration
final router = GoRouter(
  redirect: (context, state) async {
    await LoginStore.instance.waitForReady();
    if (LoginStore.instance.apiKey == null) return '/login';
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        final themeType = ThemeTypeProvider.of(context);
        return switch (themeType) {
          ThemeType.cupertino =>
            CupertinoPage(title: 'Resources', child: HomePage()),
          ThemeType.material ||
          ThemeType.lambda =>
            MaterialPage(child: HomePage())
        };
      },
      routes: [
        GoRoute(
          path: 'instance/:id',
          builder: (context, state) =>
              InstancesPage(instanceId: state.pathParameters['id']!),
        ),
        GoRoute(
          path: 'filesystems',
          builder: (context, state) => FilesystemsPage(),
        ),
        GoRoute(
          path: 'ssh',
          builder: (context, state) => SshKeysPage(),
        ),
        GoRoute(
          path: 'firewall',
          builder: (context, state) => FirewallPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
  ],
);
