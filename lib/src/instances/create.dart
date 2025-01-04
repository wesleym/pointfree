import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget body;

    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        body = SliverList.list(
          children: [
            CupertinoListTile(
              onTap: () => showCupertinoModalPopup(
                semanticsDismissible: true,
                context: context,
                builder: (context) => Container(
                  height: 216,
                  color: CupertinoColors.systemBackground.resolveFrom(context),
                  child: CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (value) {},
                    children: [
                      Text('hi'),
                      Text('ho'),
                    ],
                  ),
                ),
              ),
              title: Text('Instance type'),
              trailing: Text('sup'),
            ),
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
