import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/filesystems/picker_page.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/instance_types/picker_page.dart';
import 'package:lambda_gui/src/instance_types/regions_picker_page.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/ssh/picker_page.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:openapi/api.dart';

class CupertinoLaunchInstancePage extends StatelessWidget {
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

  CupertinoLaunchInstancePage({
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

    Color? backgroundColor;

    backgroundColor = CupertinoColors.systemGroupedBackground;
    const inactiveColor = CupertinoColors.inactiveGray;

    return PlatformScaffold(
      backgroundColor: backgroundColor,
      topBar: PlatformTopBar(),
      body: Form(
        child: ListView(
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
              onPressed: _onLaunchPressed,
              child: Text(
                'Start',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onCupertinoInstanceTypeTap(BuildContext context) async {
    final instanceTypeName = await Navigator.of(context).push<String>(
        CupertinoPageRoute(builder: (context) => InstanceTypesPickerPage()));

    if (instanceTypeName != null && instanceTypeName != _instanceTypeName) {
      _onInstanceTypeNameChange(instanceTypeName);
    }
  }

  void Function()? _cupertinoRegionTapHandler(BuildContext context) {
    final instanceType = _instanceTypeName;
    if (instanceType == null) return null;

    return () async {
      final regionCode = await Navigator.of(context).push<String>(
          CupertinoPageRoute(
              builder: (context) =>
                  RegionsPickerPage(instanceType: instanceType)));

      if (regionCode != null && regionCode != _regionCode) {
        _onRegionCodeChange(regionCode);
      }
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

      if (filesystemId != null && filesystemId != _filesystemId) {
        _onFilesystemIdChange(filesystemId);
      }
    };
  }

  void _onCupertinoSshKeyTap(BuildContext context) async {
    final sshKeyId = await Navigator.of(context).push<String>(
        CupertinoPageRoute(builder: (context) => SshKeyPickerPage()));
    if (sshKeyId != null && sshKeyId != _sshKeyId) {
      _onSshKeyIdChange(sshKeyId);
    }
  }
}
