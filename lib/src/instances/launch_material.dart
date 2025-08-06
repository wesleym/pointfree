import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lambda_gui/src/filesystems/picker_dialog.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/images/picker_dialog.dart';
import 'package:lambda_gui/src/instance_types/picker_dialog.dart';
import 'package:lambda_gui/src/instance_types/regions_picker_dialog.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/instances/launch.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/ssh/picker_dialog.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:openapi/api.dart' as api;

class MaterialLaunchInstancePage extends StatelessWidget {
  final String? _instanceTypeName;
  final void Function(String? instanceType) _onInstanceTypeNameChange;
  final api.Image? _image;
  final void Function(api.Image? instanceType) _onImageChange;
  final api.PublicRegionCode? _regionCode;
  final void Function(api.PublicRegionCode? instanceType) _onRegionCodeChange;
  final String? _filesystemId;
  final void Function(String? instanceType) _onFilesystemIdChange;
  final String? _sshKeyId;
  final void Function(String? instanceType) _onSshKeyIdChange;
  final void Function()? _onLaunchPressed;

  final _instanceTypesRepository = InstanceTypesRepository.instance;
  final _filesystemRepository = FilesystemsRepository.instance;
  final _sshKeyRepository = SshKeysRepository.instance;

  MaterialLaunchInstancePage({
    super.key,
    required String? instanceTypeName,
    required void Function(String?) onInstanceTypeNameChange,
    required api.Image? image,
    required void Function(api.Image? instanceType) onImageChange,
    required api.PublicRegionCode? regionCode,
    required void Function(api.PublicRegionCode?) onRegionCodeChange,
    required String? filesystemId,
    required void Function(String?) onFilesystemIdChange,
    required String? sshKeyId,
    required void Function(String?) onSshKeyIdChange,
    void Function()? onLaunchPressed,
  })  : _onSshKeyIdChange = onSshKeyIdChange,
        _sshKeyId = sshKeyId,
        _onFilesystemIdChange = onFilesystemIdChange,
        _filesystemId = filesystemId,
        _onRegionCodeChange = onRegionCodeChange,
        _regionCode = regionCode,
        _onInstanceTypeNameChange = onInstanceTypeNameChange,
        _instanceTypeName = instanceTypeName,
        _image = image,
        _onImageChange = onImageChange,
        _onLaunchPressed = onLaunchPressed;

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    api.InstanceType? instanceType;
    final instanceTypeName = _instanceTypeName;
    if (instanceTypeName == null) {
      instanceType = null;
    } else {
      instanceType =
          _instanceTypesRepository.getByName(instanceTypeName)?.instanceType;
    }

    Widget? instanceDisplayName;
    if (instanceType != null) {
      instanceDisplayName = Text(instanceType.description);
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

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Launch')),
      body: Form(
          child: ListView(children: [
        ListTile(
          onTap: () => _onMaterialInstanceTypeTap(context),
          title: Text('Instance type'),
          subtitle: instanceDisplayName ?? Text(''),
        ),
        ListTile(
          onTap: () => _onMaterialImageTap(context),
          title: Text('Image'),
          subtitle: Text(_image?.family ?? ''),
        ),
        ListTile(
          enabled: _instanceTypeName != null,
          onTap: _materialRegionTapHandler(context),
          title: Text('Region'),
          subtitle: Text(regionDisplayName ?? ''),
        ),
        ListTile(
          enabled: _regionCode != null,
          onTap: _handleMaterialFilesystemTap(context),
          title: Text('Filesystem'),
          subtitle: Text(filesystemDisplayName ?? ''),
        ),
        ListTile(
          onTap: () => _onMaterialSshKeyTap(context),
          title: Text('SSH key'),
          subtitle: Text(sshKeyDisplayName ?? ''),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child:
              FilledButton(onPressed: _onLaunchPressed, child: Text('Start')),
        ),
      ])),
    );
  }

  void _onMaterialInstanceTypeTap(BuildContext context) async {
    final instanceTypeName = await showDialog(
        context: context, builder: (context) => InstanceTypesPickerDialog());

    if (instanceTypeName != null && instanceTypeName != _instanceTypeName) {
      _onInstanceTypeNameChange(instanceTypeName);
    }
  }

  void _onMaterialImageTap(BuildContext context) async {
    final image = await showDialog<api.Image?>(
        context: context, builder: (context) => ImagePickerDialog());

    if (image != null && image != _image) {
      _onImageChange(image);
    }
  }

  void Function()? _materialRegionTapHandler(BuildContext context) {
    final instanceTypeName = _instanceTypeName;
    if (instanceTypeName == null) {
      return null;
    }
    return () async {
      final regionCode = await showDialog<api.PublicRegionCode>(
          context: context,
          builder: (context) =>
              RegionsPickerDialog(instanceType: instanceTypeName));

      if (regionCode != null && regionCode != _regionCode) {
        _onRegionCodeChange(regionCode);
      }
    };
  }

  void Function()? _handleMaterialFilesystemTap(BuildContext context) {
    if (_regionCode == null) return null;

    return () async {
      final filesystemId = await showDialog(
          context: context,
          builder: (context) =>
              FilesystemsPickerDialog(regionCode: _regionCode));

      if (filesystemId == null) {
        // Cancelled.
        return;
      }

      if (filesystemId == noneItemId) {
        _onFilesystemIdChange(null);
        return;
      }

      _onFilesystemIdChange(filesystemId);
    };
  }

  void _onMaterialSshKeyTap(BuildContext context) async {
    final sshKeyId = await showDialog<String>(
        context: context, builder: (context) => SshKeyPickerDialog());

    if (sshKeyId != null && sshKeyId != _sshKeyId) {
      _onSshKeyIdChange(sshKeyId);
    }
  }
}
