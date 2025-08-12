import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/home.dart';
import 'package:lambda_gui/src/instances/page.dart';
import 'package:lambda_gui/src/login/page.dart';
import 'package:lambda_gui/src/login/store.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

// GoRouter configuration
final router = GoRouter(
  redirect: (context, state) {
    if (LoginStore.instance.apiKey == null) return '/login';
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        final themeType = ThemeTypeProvider.of(context);
        switch (themeType) {
          case ThemeType.cupertino:
            return CupertinoPage(title: 'Instances', child: HomePage());
          case ThemeType.material:
          case ThemeType.lambda:
            return MaterialPage(child: HomePage());
        }
      },
      routes: [
        GoRoute(
          path: 'instance/:id',
          builder: (context, state) =>
              InstancesPage(instanceId: state.pathParameters['id']!),
        ),
      ],
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
  ],
);
