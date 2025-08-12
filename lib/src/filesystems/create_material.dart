import 'package:flutter/material.dart';
import 'package:pointfree/src/filesystems/all_regions_picker_dialog.dart';
import 'package:pointfree/src/filesystems/name_dialog.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:openapi/api.dart';

class MaterialCreateFilesystemPage extends StatelessWidget {
  final String? _name;
  final void Function(String? instanceType) _onNameChange;
  final PublicRegionCode? _regionCode;
  final void Function(PublicRegionCode? instanceType) _onRegionCodeChange;
  final void Function()? _onLaunchPressed;

  const MaterialCreateFilesystemPage({
    super.key,
    required String? name,
    required void Function(String?) onNameChange,
    required PublicRegionCode? regionCode,
    required void Function(PublicRegionCode?) onRegionCodeChange,
    void Function()? onLaunchPressed,
  })  : _onRegionCodeChange = onRegionCodeChange,
        _regionCode = regionCode,
        _onNameChange = onNameChange,
        _name = name,
        _onLaunchPressed = onLaunchPressed;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Filesystem')),
      body: Form(
          child: ListView(children: [
        ListTile(
          onTap: () => _handleNameTap(context),
          title: Text('Name'),
          subtitle: Text(_name ?? ''),
        ),
        ListTile(
          enabled: _name != null,
          onTap: () => _handleRegionTap(context),
          title: Text('Region'),
          subtitle: Text(_regionCode?.value ?? ''),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: _onLaunchPressed,
            child: Text('Create'),
          ),
        ),
      ])),
    );
  }

  void _handleNameTap(BuildContext context) async {
    final instanceTypeName = await showDialog<String?>(
        context: context, builder: (context) => NameDialog(initialName: _name));

    if (instanceTypeName != null && instanceTypeName != _name) {
      _onNameChange(instanceTypeName);
    }
  }

  void _handleRegionTap(BuildContext context) async {
    final regionCode = await showDialog<PublicRegionCode>(
        context: context, builder: (context) => AllRegionsPickerDialog());

    if (regionCode != null && regionCode != _regionCode) {
      _onRegionCodeChange(regionCode);
    }
  }
}
