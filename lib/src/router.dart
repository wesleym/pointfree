import 'package:go_router/go_router.dart';
import 'package:lambda_gui/main.dart';
import 'package:lambda_gui/src/instances/create.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(),
      routes: [
        GoRoute(
          path: '/instances/launch',
          builder: (context, state) => CreatePage(),
        ),
      ],
    ),
  ],
);
