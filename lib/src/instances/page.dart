import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/instances/repository.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
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

    final List<Widget> body;
    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        body = [
          Icon(CupertinoIcons.desktopcomputer, size: 96),
          SizedBox(height: 16),
          CupertinoFormSection.insetGrouped(children: [
            CupertinoFormRow(
              prefix: Text('ID'),
              child: Text(instanceId),
            ),
            CupertinoFormRow(
              prefix: Text('Name'),
              child: Text(instance.name ?? ''),
            ),
            CupertinoFormRow(
              prefix: Text('IP address'),
              child: Text(instance.ip ?? ''),
            ),
            CupertinoFormRow(
              prefix: Text('Status'),
              child: Text(instance.status.value),
            ),
          ]),
          CupertinoFormSection.insetGrouped(children: [
            CupertinoFormRow(
              prefix: Text('Instance type'),
              child: Text(instance.instanceType?.description ?? ''),
            ),
            CupertinoFormRow(
              prefix: Text('Region'),
              child: Text(instance.region == null
                  ? ''
                  : '${instance.region?.description} (${instance.region?.name})'),
            ),
          ]),
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
        ];
      default:
        body = [
          Icon(Icons.computer, size: 96),
          SizedBox(height: 16),
          PlatformListTile(
            title: Text('ID'),
            subtitle: Text(instanceId),
          ),
          PlatformListTile(
            title: Text('Name'),
            subtitle: Text(instance.name ?? ''),
          ),
          PlatformListTile(
            title: Text('IP address'),
            subtitle: Text(instance.ip ?? ''),
          ),
          PlatformListTile(
            title: Text('Status'),
            subtitle: Text(instance.status.value),
          ),
          Divider(),
          PlatformListTile(
            title: Text('Instance type'),
            subtitle: Text(instance.instanceType?.description ?? ''),
          ),
          PlatformListTile(
            title: Text('Region'),
            subtitle: Text(instance.region == null
                ? ''
                : '${instance.region?.description} (${instance.region?.name})'),
          ),
          Divider(),
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
        ];
    }

    return PlatformScaffold(
        topBar: PlatformTopBar(title: Text('GPU Instance')),
        body: ListView(
          children: body,
        ));
  }
}
