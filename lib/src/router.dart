import 'package:go_router/go_router.dart';
import 'package:lambda_gui/main.dart';
import 'package:lambda_gui/src/instances/page.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(),
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
