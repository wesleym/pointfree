import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/filesystems/repository.dart';
import 'package:pointfree/src/instance_types/repository.dart';
import 'package:pointfree/src/instances/launch_cupertino.dart';
import 'package:pointfree/src/instances/launch_material.dart';
import 'package:pointfree/src/instances/repository.dart';
import 'package:pointfree/src/ssh/repository.dart';
import 'package:pointfree/src/theme_type_provider.dart';
import 'package:openapi/api.dart' as api;

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
  api.Image? _image;
  api.PublicRegionCode? _regionCode;
  String? _filesystemId;
  String? _sshKeyId;

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    final themeType = ThemeTypeProvider.of(context).themeType;
    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoLaunchInstancePage(
          instanceTypeName: _instanceTypeName,
          onInstanceTypeNameChange: (v) =>
              setState(() => _instanceTypeName = v),
          image: _image,
          onImageChange: (v) => setState(() => _image = v),
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
          image: _image,
          onImageChange: (v) => setState(() => _image = v),
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
      final image = _image;
      api.InstanceLaunchRequestImage? requestImage;
      if (image != null) {
        requestImage = api.InstanceLaunchRequestImage(id: image.id);
      }

      await _instancesRepository.launch(
        instanceTypeName: _instanceTypeName!,
        regionCode: _regionCode!,
        filesystemName: filesystemName,
        sshKeyName: sshKeyName,
        image: requestImage,
      );

      if (mounted) {
        context.pop();
      }
    };
  }
}
