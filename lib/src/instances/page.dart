import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/instances/repository.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/text_button.dart';

class InstancesPage extends StatelessWidget {
  final String instanceId;

  final _instancesRepository = InstancesRepository.instance;

  InstancesPage({super.key, required this.instanceId});

  @override
  Widget build(BuildContext context) {
    final instance = _instancesRepository.instances
        .where((element) => element.id == instanceId)
        .singleOrNull;
    if (instance == null) {
      _instancesRepository.update();
      return CircularProgressIndicator.adaptive();
    }

    final platform = Theme.of(context).platform;
    final Color color;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        color = CupertinoColors.destructiveRed;
      default:
        color = Theme.of(context).colorScheme.error;
    }

    return PlatformScaffold(
        topBar: PlatformTopBar(title: Text('GPU Instance')),
        body: ListView(children: [
          Text(instance.name ?? instanceId),
          Text('$instance'),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            PlatformTextButton(
                onPressed: () => _instancesRepository.restart(instanceId),
                child: Text('Restart')),
            PlatformTextButton(
                onPressed: () => _instancesRepository.terminate(instanceId),
                child: Text(
                  'Terminate',
                  style: TextStyle(color: color),
                )),
          ]),
        ]));
  }
}
