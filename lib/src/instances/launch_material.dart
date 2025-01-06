import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lambda_gui/src/filesystems/picker_dialog.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/instance_types/picker_dialog.dart';
import 'package:lambda_gui/src/instance_types/regions_picker_dialog.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/ssh/picker_dialog.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:openapi/api.dart';

class MaterialLaunchInstancePage extends StatelessWidget {
  final String? _instanceTypeName;
  final void Function(String? instanceType) _onInstanceTypeNameChange;
  final String? _regionCode;
  final void Function(String? instanceType) _onRegionCodeChange;
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
    required String? regionCode,
    required void Function(String?) onRegionCodeChange,
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
        _onLaunchPressed = onLaunchPressed;

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
      topBar: PlatformTopBar(),
      body: Form(
          child: ListView(children: [
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
              subtitle: instanceDisplayName ?? Text(''),
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
              enabled: _instanceTypeName != null,
              onTap: _materialRegionTapHandler(context),
              title: Text('Region'),
              subtitle: Text(regionDisplayName ?? ''),
            );
          },
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
          child: ElevatedButton(
            onPressed: _onLaunchPressed,
            child: Text('Start'),
          ),
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

  void Function()? _materialRegionTapHandler(BuildContext context) {
    final instanceTypeName = _instanceTypeName;
    if (instanceTypeName == null) {
      return null;
    }
    return () async {
      final regionCode = await showDialog(
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

      if (filesystemId != null && filesystemId != _filesystemId) {
        _onFilesystemIdChange(filesystemId);
      }
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
