import 'package:flutter/cupertino.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';

class InstancesPage extends StatelessWidget {
  final String instanceId;

  const InstancesPage({super.key, required this.instanceId});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(body: Text('Page for $instanceId'));
  }
}
