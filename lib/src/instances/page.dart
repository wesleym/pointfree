import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/instances/repository.dart';
import 'package:pointfree/src/platform/circular_progress_indicator.dart';
import 'package:pointfree/src/platform/list_tile.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/platform/text_button.dart';
import 'package:pointfree/src/theme_type_provider.dart';

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
      return PlatformCircularProgressIndicator();
    }

    final themeType = ThemeTypeProvider.of(context).themeType;

    final Color color;
    switch (themeType) {
      case ThemeType.cupertino:
        color = CupertinoColors.destructiveRed;
      default:
        color = Theme.of(context).colorScheme.error;
    }

    final List<Widget> body;
    switch (themeType) {
      case ThemeType.cupertino:
        body = [
          Icon(CupertinoIcons.desktopcomputer, size: 96),
          SizedBox(height: 32),
          CupertinoFormSection(
            children: [
              CupertinoFormRow(
                prefix: Text('ID'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(instanceId),
                ),
              ),
              CupertinoTextFormFieldRow(
                prefix: Text('Name'),
                initialValue: instance.name,
                textAlign: TextAlign.end,
                onChanged: (value) =>
                    _instancesRepository.rename(id: instanceId, name: value),
              ),
              CupertinoFormRow(
                prefix: Text('IP address'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(instance.ip ?? ''),
                ),
              ),
              CupertinoFormRow(
                prefix: Text('Status'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(instance.status.value),
                ),
              ),
            ],
          ),
          CupertinoFormSection(
            children: [
              CupertinoFormRow(
                prefix: Text('Instance type'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(instance.instanceType.description),
                ),
              ),
              CupertinoFormRow(
                prefix: Text('Region'),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${instance.region.description} (${instance.region.name})',
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlatformTextButton(
                onPressed: () => _instancesRepository.restart(instanceId),
                child: Text('Restart'),
              ),
              PlatformTextButton(
                onPressed: () => _handleCupertinoTerminatePressed(context),
                child: Text('Terminate', style: TextStyle(color: color)),
              ),
            ],
          ),
        ];
      default:
        body = [
          Icon(Icons.computer, size: 96),
          SizedBox(height: 32),
          PlatformListTile(title: Text('ID'), subtitle: Text(instanceId)),
          PlatformListTile(
            title: Text('Name'),
            subtitle: Text(instance.name ?? ''),
            onTap: () => _onMaterialRename(context, instance.name),
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
            subtitle: Text(instance.instanceType.description),
          ),
          PlatformListTile(
            title: Text('Region'),
            subtitle: Text(
              '${instance.region.description} (${instance.region.name})',
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlatformTextButton(
                onPressed: () => _instancesRepository.restart(instanceId),
                child: Text('Restart'),
              ),
              PlatformTextButton(
                onPressed: () => _handleMaterialTerminatePressed(context),
                child: Text('Terminate', style: TextStyle(color: color)),
              ),
            ],
          ),
        ];
    }

    var name = instance.name;
    Widget? title;
    if (name != null) {
      title = Text(name);
    }

    return PlatformScaffold(
      topBar: PlatformTopBar(title: title),
      body: Center(child: ListView(shrinkWrap: true, children: body)),
    );
  }

  void _handleMaterialTerminatePressed(BuildContext context) async {
    final go = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Terminate instance'),
        actions: [
          TextButton(
            onPressed: () => context.pop(true),
            child: Text(
              'Terminate',
              textAlign: TextAlign.end,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
          TextButton(
            onPressed: () => context.pop(false),
            child: Text('Cancel', textAlign: TextAlign.end),
          ),
        ],
      ),
    );

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
            child: Text('Terminate'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => context.pop(false),
          isDefaultAction: true,
          child: Text('Cancel'),
        ),
      ),
    );

    if (go != true) return;

    _instancesRepository.terminate(instanceId);
  }

  Future<void> _onMaterialRename(
    BuildContext context,
    String? initialName,
  ) async {
    final name = await showDialog<String>(
      context: context,
      builder: (context) {
        final controller = TextEditingController(text: initialName);
        return AlertDialog(
          title: Text('Rename instance'),
          content: TextField(autofocus: true, controller: controller),
          actions: [
            TextButton(onPressed: () => context.pop(), child: Text('Cancel')),
            TextButton(
              onPressed: () => context.pop(controller.text),
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    if (name == null) return;
    await _instancesRepository.rename(id: instanceId, name: name);
  }
}
