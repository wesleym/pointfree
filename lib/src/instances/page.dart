import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          SizedBox(height: 32),
          CupertinoListSection.insetGrouped(children: [
            CupertinoListTile(
              title: Text('ID'),
              additionalInfo: Text(instanceId),
            ),
            CupertinoListTile(
              title: Text('Name'),
              additionalInfo: Text(instance.name ?? ''),
            ),
            CupertinoListTile(
              title: Text('IP address'),
              additionalInfo: Text(instance.ip ?? ''),
            ),
            CupertinoListTile(
              title: Text('Status'),
              additionalInfo: Text(instance.status.value),
            ),
          ]),
          CupertinoListSection.insetGrouped(children: [
            CupertinoListTile(
              title: Text('Instance type'),
              additionalInfo: Text(instance.instanceType?.description ?? ''),
            ),
            CupertinoListTile(
              title: Text('Region'),
              additionalInfo: Text(instance.region == null
                  ? ''
                  : '${instance.region?.description} (${instance.region?.name})'),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            PlatformTextButton(
                onPressed: () => _instancesRepository.restart(instanceId),
                child: Text('Restart')),
            PlatformTextButton(
                onPressed: () => _handleCupertinoTerminatePressed(context),
                child: Text(
                  'Terminate',
                  style: TextStyle(color: color),
                )),
          ]),
        ];
      default:
        body = [
          Icon(Icons.computer, size: 96),
          SizedBox(height: 32),
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
                onPressed: () => _handleMaterialTerminatePressed(context),
                child: Text(
                  'Terminate',
                  style: TextStyle(color: color),
                )),
          ]),
        ];
    }

    var name = instance.name;
    Widget? title;
    if (name != null) {
      title = Text(name);
    }

    return PlatformScaffold(
        topBar: PlatformTopBar(title: title),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: body,
          ),
        ));
  }

  void _handleMaterialTerminatePressed(BuildContext context) async {
    final go = await showDialog<bool>(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text('Terminate instance'), actions: [
              TextButton(
                  onPressed: () => context.pop(true),
                  child: Text('Terminate',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error))),
              TextButton(
                  onPressed: () => context.pop(false),
                  child: Text('Cancel', textAlign: TextAlign.end)),
            ]));

    if (go != true) return;

    _instancesRepository.terminate(instanceId);
  }

  void _handleCupertinoTerminatePressed(BuildContext context) async {
    final go = await showCupertinoModalPopup<bool>(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () => context.pop(true),
                    isDestructiveAction: true,
                    child: Text('Terminate')),
              ],
              cancelButton: CupertinoActionSheetAction(
                  onPressed: () => context.pop(false),
                  isDefaultAction: true,
                  child: Text('Cancel')),
            ));

    if (go != true) return;

    _instancesRepository.terminate(instanceId);
  }
}
