import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/text_button.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';
import 'package:openapi/api.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _instanceTypesRepository = InstanceTypesRepository.instance;
  String? _instanceType;

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    InstanceType? instanceType;
    final thisInstanceType = _instanceType;

    if (thisInstanceType != null) {
      instanceType =
          _instanceTypesRepository.getByName(thisInstanceType)?.instanceType;
    }

    String? instanceDisplayName;
    if (instanceType != null) {
      instanceDisplayName =
          '${instanceType.specs.gpus}×${instanceType.gpuDescription}';
    }

    final Widget body;
    Color? backgroundColor;

    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        backgroundColor = CupertinoColors.systemGroupedBackground;
        body = SliverList.list(
          children: [
            CupertinoListSection.insetGrouped(
              hasLeading: false,
              children: [
                StreamBuilder(
                  initialData: _instanceTypesRepository.instanceTypes,
                  stream: _instanceTypesRepository.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      // TODO: Error handling
                      return CircularProgressIndicator.adaptive();
                    }
                    return CupertinoListTile(
                      onTap: () => _onInstanceTypeTap(context),
                      title: Text('Instance type'),
                      additionalInfo:
                          Text(instanceDisplayName ?? 'None selected'),
                      trailing: CupertinoListTileChevron(),
                    );
                  },
                ),
                CupertinoListTile(
                  onTap: () => _onInstanceTypeTap(context),
                  title: Text('Region'),
                  additionalInfo: Text(_instanceType ?? 'Not selected'),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile(
                  onTap: () => _onInstanceTypeTap(context),
                  title: Text('Filesystem'),
                  additionalInfo: Text(_instanceType ?? 'Not selected'),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile(
                  onTap: () => _onInstanceTypeTap(context),
                  title: Text('SSH'),
                  additionalInfo: Text(_instanceType ?? 'Not selected'),
                  trailing: CupertinoListTileChevron(),
                ),
              ],
            ),
          ],
        );
      default:
        body = SliverList.list(children: [
          ListTile(title: Text('1×A10'), trailing: Icon(Icons.check)),
          ListTile(title: Text('1×A100'), trailing: Icon(Icons.check)),
          Divider(),
          ListTile(
            title: Text('California, USA'),
            subtitle: Text('us-west-1'),
            trailing: Icon(CupertinoIcons.checkmark),
          ),
          ListTile(
            title: Text('Virginia, USA'),
            subtitle: Text('us-east-1'),
            trailing: Icon(CupertinoIcons.checkmark),
          ),
          Divider(),
          ListTile(
            title: Text('California, USA'),
            subtitle: Text('us-west-1'),
            trailing: Icon(CupertinoIcons.checkmark),
          ),
          ListTile(
            title: Text('Virginia, USA'),
            subtitle: Text('us-east-1'),
            trailing: Icon(CupertinoIcons.checkmark),
          ),
          Divider(),
          ListTile(
            title: Text('California, USA'),
            subtitle: Text('us-west-1'),
            trailing: Icon(CupertinoIcons.checkmark),
          ),
          ListTile(
            title: Text('Virginia, USA'),
            subtitle: Text('us-east-1'),
            trailing: Icon(CupertinoIcons.checkmark),
          ),
        ]);
    }

    return PlatformScaffold(
        backgroundColor: backgroundColor,
        body: Form(
          child: CustomScrollView(slivers: [
            PlatformTopBarSliver(
              action: PlatformTextButton(
                onPressed: () {},
                child: Text('Launch'),
              ),
              title: Text('Launch GPU instance'),
            ),
            body,
          ]),
        ));
  }

  void _onInstanceTypeTap(BuildContext context) async {
    final instanceType =
        await context.push<String>('/instances/launch/instance-types');
    setState(() => _instanceType = instanceType);
  }
}
