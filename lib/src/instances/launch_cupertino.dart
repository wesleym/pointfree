import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lambda_gui/src/filesystems/picker_page.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/images/picker_page.dart';
import 'package:lambda_gui/src/images/repository.dart';
import 'package:lambda_gui/src/instance_types/picker_page.dart';
import 'package:lambda_gui/src/instance_types/regions_picker_page.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/instances/launch.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/ssh/picker_page.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:openapi/api.dart' as api;

class CupertinoLaunchInstancePage extends StatelessWidget {
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
  final _imagesRepository = ImagesRepository.instance;
  final _filesystemRepository = FilesystemsRepository.instance;
  final _sshKeyRepository = SshKeysRepository.instance;

  CupertinoLaunchInstancePage({
    super.key,
    required String? instanceTypeName,
    required void Function(String?) onInstanceTypeNameChange,
    required api.Image? image,
    required void Function(api.Image?) onImageChange,
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
    unawaited(_imagesRepository.update());

    api.InstanceType? instanceType;
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
                    return CupertinoListTile.notched(
                      onTap: () => _onCupertinoInstanceTypeTap(context),
                      title: Text('Instance type'),
                      additionalInfo: instanceDisplayName,
                      trailing: CupertinoListTileChevron(),
                    );
                  },
                ),
                StreamBuilder(
                  initialData: _imagesRepository.images,
                  stream: _imagesRepository.stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      // TODO: Error handling
                      return CircularProgressIndicator.adaptive();
                    }
                    return CupertinoListTile.notched(
                      onTap: () => _onCupertinoImageTap(context),
                      title: Text('Image'),
                      additionalInfo:
                          _image == null ? null : Text(_image.family),
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
                    return CupertinoListTile.notched(
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
                CupertinoListTile.notched(
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
                CupertinoListTile.notched(
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

  void _onCupertinoImageTap(BuildContext context) async {
    final image = await Navigator.of(context).push<api.Image?>(
        CupertinoPageRoute(builder: (context) => ImagePickerPage()));

    if (image != null && image != _image) {
      _onImageChange(image);
    }
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
      final regionCode = await Navigator.of(context).push<api.PublicRegionCode>(
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

  void _onCupertinoSshKeyTap(BuildContext context) async {
    final sshKeyId = await Navigator.of(context).push<String>(
        CupertinoPageRoute(builder: (context) => SshKeyPickerPage()));
    if (sshKeyId != null && sshKeyId != _sshKeyId) {
      _onSshKeyIdChange(sshKeyId);
    }
  }
}
