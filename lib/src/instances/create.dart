import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/text_button.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:openapi/api.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _instanceTypesRepository = InstanceTypesRepository.instance;
  final _filesystemRepository = FilesystemsRepository.instance;
  final _sshKeyRepository = SshKeysRepository.instance;
  String? _instanceType;
  String? _regionCode;
  String? _filesystemId;
  String? _sshKeyId;

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

    final thisRegionCode = _regionCode;
    String? regionDisplayName;
    if (thisInstanceType != null && thisRegionCode != null) {
      regionDisplayName = _instanceTypesRepository
          .getByName(thisInstanceType)
          ?.regionsWithCapacityAvailable
          .where((region) => region.name == thisRegionCode)
          .singleOrNull
          ?.description;
    }

    final thisFilesystemId = _filesystemId;
    String? filesystemDisplayName;
    if (thisFilesystemId != null) {
      filesystemDisplayName =
          _filesystemRepository.getById(thisFilesystemId)?.name;
    }

    final thisSshKeyIds = _sshKeyId;
    String? sshKeyDisplayName;
    if (thisSshKeyIds != null) {
      sshKeyDisplayName = _sshKeyRepository.getById(thisSshKeyIds)?.name;
    }

    final Widget body;
    Color? backgroundColor;

    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        backgroundColor = CupertinoColors.systemGroupedBackground;
        body = ListView(
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
                StreamBuilder(
                  initialData: _instanceTypesRepository.instanceTypes,
                  stream: _instanceTypesRepository.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      // TODO: Error handling
                      return CircularProgressIndicator.adaptive();
                    }
                    return CupertinoListTile(
                      onTap: _onRegionTapHandler(context),
                      title: Text('Region'),
                      additionalInfo: Text(regionDisplayName ?? 'Not selected'),
                      trailing: CupertinoListTileChevron(),
                    );
                  },
                ),
                CupertinoListTile(
                  onTap: () => _onFilesystemTap(context),
                  title: Text('Filesystem'),
                  additionalInfo: Text(filesystemDisplayName ?? 'Not selected'),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile(
                  onTap: () => _onSshKeyTap(context),
                  title: Text('SSH'),
                  additionalInfo: Text(sshKeyDisplayName ?? 'Not selected'),
                  trailing: CupertinoListTileChevron(),
                ),
              ],
            ),
          ],
        );
      default:
        body = ListView(children: [
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
      topBar: PlatformTopBar(
        title: Text('New GPU instance'),
        action: PlatformTextButton(
          cupertinoPadding: EdgeInsets.zero,
          onPressed: _launchHandler(),
          child: Text('Launch'),
        ),
      ),
      body: Form(child: body),
    );
  }

  void _onInstanceTypeTap(BuildContext context) async {
    final instanceType =
        await context.push<String>('/instances/launch/instance-types');
    setState(() => _instanceType = instanceType);
  }

  void Function()? _onRegionTapHandler(BuildContext context) {
    final thisInstanceType = _instanceType;
    if (thisInstanceType == null) {
      return null;
    }
    return () async {
      // TODO: URL escaping.
      final regionCode = await context.push<String>(
          '/instances/launch/regions?instance_type=$thisInstanceType');
      log('Got region code $regionCode');
      setState(() => _regionCode = regionCode);
    };
  }

  void _onFilesystemTap(BuildContext context) async {
    final filesystemId =
        await context.push<String>('/instances/launch/filesystems');
    setState(() => _filesystemId = filesystemId);
  }

  void _onSshKeyTap(BuildContext context) async {
    final sshKeyId = await context.push<String>('/instances/launch/ssh-keys');
    setState(() => _sshKeyId = sshKeyId);
  }

  void Function()? _launchHandler() {
    if ([_instanceType, _regionCode, _filesystemId, _sshKeyId].contains(null)) {
      return null;
    }

    return () {};
  }
}
