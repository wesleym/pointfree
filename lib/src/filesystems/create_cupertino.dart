import 'package:flutter/cupertino.dart';
import 'package:pointfree/src/filesystems/all_regions_picker_page.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:openapi/api.dart';

class CupertinoCreateFilesystemPage extends StatelessWidget {
  final String? _name;
  final void Function(String? instanceType) _onNameChange;
  final PublicRegionCode? _regionCode;
  final void Function(PublicRegionCode? instanceType) _onRegionCodeChange;
  final void Function()? _onLaunchPressed;

  const CupertinoCreateFilesystemPage({
    super.key,
    required String? name,
    required void Function(String?) onNameChange,
    required PublicRegionCode? regionCode,
    required void Function(PublicRegionCode?) onRegionCodeChange,
    void Function()? onLaunchPressed,
  }) : _onRegionCodeChange = onRegionCodeChange,
       _regionCode = regionCode,
       _onNameChange = onNameChange,
       _name = name,
       _onLaunchPressed = onLaunchPressed;

  @override
  Widget build(BuildContext context) {
    String? regionDisplayName = _regionCode?.value;

    Color? backgroundColor;

    backgroundColor = CupertinoColors.systemGroupedBackground;

    return PlatformScaffold(
      backgroundColor: backgroundColor,
      topBar: PlatformTopBar(),
      body: Form(
        child: ListView(
          children: [
            CupertinoFormSection.insetGrouped(
              children: [
                CupertinoTextFormFieldRow(
                  prefix: Text('Name'),
                  textAlign: TextAlign.end,
                  onChanged: (value) => _onNameChange(value),
                  initialValue: _name,
                ),
              ],
            ),
            CupertinoListSection.insetGrouped(
              hasLeading: false,
              children: [
                CupertinoListTile.notched(
                  onTap: () => _handleRegionTap(context),
                  title: Text('Region'),
                  additionalInfo: regionDisplayName == null
                      ? null
                      : Text(regionDisplayName),
                  trailing: CupertinoListTileChevron(),
                ),
              ],
            ),
            CupertinoButton(
              onPressed: _onLaunchPressed,
              child: Text(
                'Create',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegionTap(BuildContext context) async {
    final regionCode = await Navigator.of(context).push<PublicRegionCode>(
      CupertinoPageRoute(builder: (context) => AllRegionsPickerPage()),
    );

    if (regionCode != null && regionCode != _regionCode) {
      _onRegionCodeChange(regionCode);
    }
  }
}
