import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/picker_dialog.dart';
import 'package:lambda_gui/src/filesystems/picker_page.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/instance_types/picker_dialog.dart';
import 'package:lambda_gui/src/instance_types/picker_page.dart';
import 'package:lambda_gui/src/instance_types/regions_picker_dialog.dart';
import 'package:lambda_gui/src/instance_types/regions_picker_page.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/instances/repository.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/ssh/picker_dialog.dart';
import 'package:lambda_gui/src/ssh/picker_page.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:openapi/api.dart';

class LaunchInstancePage extends StatefulWidget {
  const LaunchInstancePage({super.key});

  @override
  State<LaunchInstancePage> createState() => _LaunchInstancePageState();
}

class _LaunchInstancePageState extends State<LaunchInstancePage> {
  final _instancesRepository = InstancesRepository.instance;
  final _instanceTypesRepository = InstanceTypesRepository.instance;
  final _filesystemRepository = FilesystemsRepository.instance;
  final _sshKeyRepository = SshKeysRepository.instance;
  String? _instanceTypeName;
  String? _regionCode;
  String? _filesystemId;
  String? _sshKeyId;

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    InstanceType? instanceType;
    final instanceTypeName = _instanceTypeName;
    if (instanceTypeName != null) {
      instanceType =
          _instanceTypesRepository.getByName(instanceTypeName)?.instanceType;
    }

    Widget? instanceDisplayName;
    if (instanceType != null) {
      instanceDisplayName =
          Text('${instanceType.specs.gpus}×${instanceType.gpuDescription}');
    }

    final thisRegionCode = _regionCode;
    String? regionDisplayName;
    if (instanceTypeName != null && thisRegionCode != null) {
      regionDisplayName = _instanceTypesRepository
          .getByName(instanceTypeName)
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
        const inactiveColor = CupertinoColors.inactiveGray;
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
                      additionalInfo: instanceDisplayName,
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
                      title: Text('Region',
                          style: TextStyle(
                              color: _instanceTypeName == null
                                  ? inactiveColor
                                  : null)),
                      additionalInfo: regionDisplayName == null
                          ? null
                          : Text(regionDisplayName),
                      trailing: _instanceTypeName == null
                          ? null
                          : CupertinoListTileChevron(),
                    );
                  },
                ),
                CupertinoListTile(
                  onTap: _handleCupertinoFilesystemTap(context),
                  title: Text(
                    'Filesystem',
                    style: TextStyle(
                        color: _regionCode == null ? inactiveColor : null),
                  ),
                  additionalInfo: filesystemDisplayName == null
                      ? null
                      : Text(filesystemDisplayName),
                  trailing:
                      _regionCode == null ? null : CupertinoListTileChevron(),
                ),
                CupertinoListTile(
                  onTap: () => _onCupertinoSshKeyTap(context),
                  title: Text('SSH'),
                  additionalInfo: sshKeyDisplayName == null
                      ? null
                      : Text(sshKeyDisplayName),
                  trailing: CupertinoListTileChevron(),
                ),
              ],
            ),
            CupertinoButton(
              onPressed: _launchHandler(),
              child: Text('Launch'),
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
                subtitle: instanceDisplayName,
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
                subtitle:
                    regionDisplayName == null ? null : Text(regionDisplayName),
              );
            },
          ),
          ListTile(
            onTap: _handleMaterialFilesystemTap(context),
            title: Text('Filesystem'),
            subtitle: filesystemDisplayName == null
                ? null
                : Text(filesystemDisplayName),
          ),
          ListTile(
            onTap: () => _onMaterialSshKeyTap(context),
            title: Text('SSH key'),
            subtitle:
                sshKeyDisplayName == null ? null : Text(sshKeyDisplayName),
          ),
          ElevatedButton(
            onPressed: _launchHandler(),
            child: Text('Launch'),
          ),
        ]);
    }

    return PlatformScaffold(
      backgroundColor: backgroundColor,
      topBar: PlatformTopBar(title: Text('New GPU instance')),
      body: Form(child: body),
    );
  }

  void _onCupertinoInstanceTypeTap(BuildContext context) async {
    final instanceType = await Navigator.of(context).push<String>(
        CupertinoPageRoute(builder: (context) => InstanceTypesPickerPage()));
    setState(() => _instanceTypeName = instanceType);
  }

  void Function()? _cupertinoRegionTapHandler(BuildContext context) {
    final instanceType = _instanceTypeName;
    if (instanceType == null) return null;

    return () async {
      final regionCode = await Navigator.of(context).push<String>(
          CupertinoPageRoute(
              builder: (context) =>
                  RegionsPickerPage(instanceType: instanceType)));
      setState(() => _regionCode = regionCode ?? _regionCode);
    };
  }

  void Function()? _handleCupertinoFilesystemTap(BuildContext context) {
    var regionCode = _regionCode;
    if (regionCode == null) return null;

    return () async {
      final filesystemId = await Navigator.of(context).push<String>(
          CupertinoPageRoute(
              builder: (context) =>
                  FilesystemsPickerPage(regionCode: regionCode)));
      setState(() => _filesystemId = filesystemId ?? _filesystemId);
    };
  }

  void _onCupertinoSshKeyTap(BuildContext context) async {
    final sshKeyId = await Navigator.of(context).push<String>(
        CupertinoPageRoute(builder: (context) => SshKeyPickerPage()));
    setState(() => _sshKeyId = sshKeyId ?? _sshKeyId);
  }

  void Function()? _launchHandler() {
    if ([_instanceTypeName, _regionCode, _filesystemId, _sshKeyId]
        .contains(null)) {
      return null;
    }

    final filesystemName = _filesystemRepository.getById(_filesystemId!)?.name;
    final sshKeyName = _sshKeyRepository.getById(_sshKeyId!)?.name;
    if (filesystemName == null || sshKeyName == null) {
      return null;
    }

    return () async {
      await _instancesRepository.launch(
        instanceTypeName: _instanceTypeName!,
        regionCode: _regionCode!,
        filesystemName: filesystemName,
        sshKeyName: sshKeyName,
      );

      if (mounted) {
        context.pop();
      }
    };
  }

  void _onMaterialInstanceTypeTap(BuildContext context) async {
    final instanceType = await showDialog(
        context: context, builder: (context) => InstanceTypesPickerDialog());
    setState(() => _instanceTypeName = instanceType);
  }

  void Function()? _materialRegionTapHandler(BuildContext context) {
    final thisInstanceType = _instanceTypeName;
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

  void Function()? _handleMaterialFilesystemTap(BuildContext context) {
    if (_regionCode == null) return null;

    return () async {
      final filesystemId = await showDialog(
          context: context,
          builder: (context) =>
              FilesystemsPickerDialog(regionCode: _regionCode!));
      setState(() => _filesystemId = filesystemId);
    };
  }

  void _onMaterialSshKeyTap(BuildContext context) async {
    final sshKeyId = await showDialog<String>(
        context: context, builder: (context) => SshKeyPickerDialog());
    setState(() => _sshKeyId = sshKeyId);
  }
}
