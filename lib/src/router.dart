import 'package:go_router/go_router.dart';
import 'package:lambda_gui/main.dart';
import 'package:lambda_gui/src/instance_types/list.dart';
import 'package:lambda_gui/src/instance_types/regions_list.dart';
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
          routes: [
            GoRoute(
              path: '/instance-types',
              builder: (context, state) => InstanceTypesList(),
            ),
            GoRoute(
              path: '/regions',
              builder: (context, state) => RegionsList(
                  instanceType: state.uri.queryParameters['instance_type']),
            ),
          ],
        ),
      ],
    ),
  ],
);
