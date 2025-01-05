import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/picker_dialog.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/instance_types/picker_dialog.dart';
import 'package:lambda_gui/src/instance_types/regions_picker_dialog.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/instances/repository.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/platform/text_button.dart';
import 'package:lambda_gui/src/ssh/picker_dialog.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:openapi/api.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _instancesRepository = InstancesRepository.instance;
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
                      onTap: () => _onCupertinoInstanceTypeTap(context),
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
                      onTap: _cupertinoRegionTapHandler(context),
                      title: Text('Region'),
                      additionalInfo: Text(regionDisplayName ?? 'Not selected'),
                      trailing: CupertinoListTileChevron(),
                    );
                  },
                ),
                CupertinoListTile(
                  onTap: () => _onCupertinoFilesystemTap(context),
                  title: Text('Filesystem'),
                  additionalInfo: Text(filesystemDisplayName ?? 'Not selected'),
                  trailing: CupertinoListTileChevron(),
                ),
                CupertinoListTile(
                  onTap: () => _onCupertinoSshKeyTap(context),
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
          StreamBuilder(
            initialData: _instanceTypesRepository.instanceTypes,
            stream: _instanceTypesRepository.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                // TODO: Error handling
                return CircularProgressIndicator.adaptive();
              }
              return ListTile(
                onTap: () => _onMaterialInstanceTypeTap(context),
                title: Text('Instance type'),
                subtitle: Text(instanceDisplayName ?? 'None selected'),
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
              return ListTile(
                onTap: _materialRegionTapHandler(context),
                title: Text('Region'),
                subtitle: Text(regionDisplayName ?? 'Not selected'),
              );
            },
          ),
          ListTile(
            onTap: () => _onMaterialFilesystemTap(context),
            title: Text('Filesystem'),
            subtitle: Text(filesystemDisplayName ?? 'Not selected'),
          ),
          ListTile(
            onTap: () => _onMaterialSshKeyTap(context),
            title: Text('SSH key'),
            subtitle: Text(sshKeyDisplayName ?? 'Not selected'),
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

  void _onCupertinoInstanceTypeTap(BuildContext context) async {
    final instanceType =
        await context.push<String>('/instances/launch/instance-types');
    setState(() => _instanceType = instanceType);
  }

  void Function()? _cupertinoRegionTapHandler(BuildContext context) {
    final thisInstanceType = _instanceType;
    if (thisInstanceType == null) {
      return null;
    }
    return () async {
      final url = Uri(
          path: '/instances/launch/regions',
          queryParameters: {'instance_type': thisInstanceType});
      final regionCode = await context.push<String>(url.toString());
      setState(() => _regionCode = regionCode);
    };
  }

  void _onCupertinoFilesystemTap(BuildContext context) async {
    final filesystemId =
        await context.push<String>('/instances/launch/filesystems');
    setState(() => _filesystemId = filesystemId);
  }

  void _onCupertinoSshKeyTap(BuildContext context) async {
    final sshKeyId = await context.push<String>('/instances/launch/ssh-keys');
    setState(() => _sshKeyId = sshKeyId);
  }

  void Function()? _launchHandler() {
    if ([_instanceType, _regionCode, _filesystemId, _sshKeyId].contains(null)) {
      return null;
    }

    final filesystemName = _filesystemRepository.getById(_filesystemId!)?.name;
    final sshKeyName = _sshKeyRepository.getById(_sshKeyId!)?.name;
    if (filesystemName == null || sshKeyName == null) {
      return null;
    }

    return () async {
      await _instancesRepository.launch(
        instanceTypeName: _instanceType!,
        regionCode: _regionCode!,
        filesystemName: filesystemName,
        sshKeyName: sshKeyName,
      );
    };
  }

  void _onMaterialInstanceTypeTap(BuildContext context) async {
    final instanceType = await showDialog(
        context: context, builder: (context) => InstanceTypesPickerDialog());
    setState(() => _instanceType = instanceType);
  }

  void Function()? _materialRegionTapHandler(BuildContext context) {
    final thisInstanceType = _instanceType;
    if (thisInstanceType == null) {
      return null;
    }
    return () async {
      final regionCode = await showDialog(
          context: context,
          builder: (context) =>
              RegionsPickerDialog(instanceType: thisInstanceType));
      setState(() => _regionCode = regionCode);
    };
  }

  void _onMaterialFilesystemTap(BuildContext context) async {
    final filesystemId = await showDialog(
        context: context, builder: (context) => FilesystemsPickerDialog());
    setState(() => _filesystemId = filesystemId);
  }

  void _onMaterialSshKeyTap(BuildContext context) async {
    final sshKeyId = await showDialog<String>(
        context: context, builder: (context) => SshKeyPickerDialog());
    setState(() => _sshKeyId = sshKeyId);
  }
}
