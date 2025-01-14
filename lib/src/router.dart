import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/home.dart';
import 'package:lambda_gui/src/instances/page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        final platform = Theme.of(context).platform;
        switch (platform) {
          case TargetPlatform.iOS:
          case TargetPlatform.macOS:
            return CupertinoPage(title: 'Instances', child: HomePage());
          default:
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
  ],
);
