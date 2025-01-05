import 'package:flutter/cupertino.dart';
import 'package:lambda_gui/src/instances/repository.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/text_button.dart';

class InstancesPage extends StatelessWidget {
  final String instanceId;

  final _instancesRepository = InstancesRepository.instance;

  InstancesPage({super.key, required this.instanceId});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        topBar: PlatformTopBar(title: Text('GPU Instance')),
        body: ListView(children: [
          Text(instanceId),
          Row(children: [
            PlatformTextButton(
                onPressed: () => _instancesRepository.restart(instanceId),
                child: Text('Restart')),
            PlatformTextButton(
                onPressed: () => _instancesRepository.terminate(instanceId),
                child: Text('Terminate')),
          ]),
        ]));
  }
}
