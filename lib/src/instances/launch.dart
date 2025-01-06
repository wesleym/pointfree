import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/instances/launch_cupertino.dart';
import 'package:lambda_gui/src/instances/launch_material.dart';
import 'package:lambda_gui/src/instances/repository.dart';
import 'package:lambda_gui/src/ssh/repository.dart';

const noneItemId = '__none__';

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

    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoLaunchInstancePage(
          instanceTypeName: _instanceTypeName,
          onInstanceTypeNameChange: (v) =>
              setState(() => _instanceTypeName = v),
          regionCode: _regionCode,
          onRegionCodeChange: (v) => setState(() => _regionCode = v),
          filesystemId: _filesystemId,
          onFilesystemIdChange: (v) => setState(() => _filesystemId = v),
          sshKeyId: _sshKeyId,
          onSshKeyIdChange: (v) => setState(() => _sshKeyId = v),
          onLaunchPressed: _launchHandler(),
        );
      default:
        return MaterialLaunchInstancePage(
          instanceTypeName: _instanceTypeName,
          onInstanceTypeNameChange: (v) =>
              setState(() => _instanceTypeName = v),
          regionCode: _regionCode,
          onRegionCodeChange: (v) => setState(() => _regionCode = v),
          filesystemId: _filesystemId,
          onFilesystemIdChange: (v) => setState(() => _filesystemId = v),
          sshKeyId: _sshKeyId,
          onSshKeyIdChange: (v) => setState(() => _sshKeyId = v),
          onLaunchPressed: _launchHandler(),
        );
    }
  }

  void Function()? _launchHandler() {
    if ([_instanceTypeName, _regionCode, _sshKeyId].contains(null)) {
      return null;
    }

    final sshKeyName = _sshKeyRepository.getById(_sshKeyId!)?.name;
    if (sshKeyName == null) {
      return null;
    }

    String? filesystemName;
    final filesystemId = _filesystemId;
    if (filesystemId != null) {
      filesystemName = _filesystemRepository.getById(filesystemId)?.name;
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
}
