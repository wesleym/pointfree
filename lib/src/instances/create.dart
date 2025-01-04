import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';

class CreatePage extends StatelessWidget {
  CreatePage({super.key});

  final _instanceTypesRepository = InstanceTypesRepository.instance;

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    final Widget body;

    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        body = SliverList.list(
          children: [
            StreamBuilder(
                initialData: _instanceTypesRepository.instances,
                stream: _instanceTypesRepository.stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    // TODO: Error handling
                    return CupertinoListTile.notched(title: Text('Hi'));
                  }
                  final data = snapshot.data!;
                  return CupertinoListTile(
                    onTap: () => showCupertinoModalPopup(
                      semanticsDismissible: true,
                      context: context,
                      builder: (context) => Container(
                        height: 216,
                        color: CupertinoColors.systemBackground
                            .resolveFrom(context),
                        child: CupertinoPicker.builder(
                          itemExtent: 32,
                          childCount: data.length,
                          onSelectedItemChanged: (value) {},
                          itemBuilder: (context, index) =>
                              Text(data[index].instanceType.name),
                        ),
                      ),
                    ),
                    title: Text('Instance type'),
                    trailing: Text('sup'),
                  );
                }),
            CupertinoFormSection(
              header: Text('INSTANCE TYPE'),
              children: [
                CupertinoFormRow(
                    prefix: Text('1×A10'),
                    child: Icon(CupertinoIcons.checkmark)),
                CupertinoFormRow(
                    prefix: Text('1×A100'),
                    child: Icon(CupertinoIcons.checkmark)),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              header: Text('REGION'),
              children: [
                CupertinoFormRow(
                  prefix: Text('California, USA'),
                  child: Icon(CupertinoIcons.checkmark),
                ),
                CupertinoFormRow(
                  prefix: Text('Virginia, USA'),
                  child: Icon(CupertinoIcons.checkmark),
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              header: Text('FILESYSTEM'),
              children: [
                CupertinoFormRow(
                  prefix: Text('California, USA'),
                  child: Icon(CupertinoIcons.checkmark),
                ),
                CupertinoFormRow(
                  prefix: Text('Virginia, USA'),
                  child: Icon(CupertinoIcons.checkmark),
                ),
              ],
            ),
            CupertinoFormSection.insetGrouped(
              header: Text('SSH'),
              children: [
                CupertinoFormRow(
                  prefix: Text('California, USA'),
                  child: Icon(CupertinoIcons.checkmark),
                ),
                CupertinoFormRow(
                  prefix: Text('Virginia, USA'),
                  child: Icon(CupertinoIcons.checkmark),
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
        body: Form(
      child: CustomScrollView(slivers: [
        TopBarSliver(title: Text('Launch GPU instance')),
        body,
      ]),
    ));
  }
}
