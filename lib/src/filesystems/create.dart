import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/filesystems/create_cupertino.dart';
import 'package:pointfree/src/filesystems/create_material.dart';
import 'package:pointfree/src/filesystems/repository.dart';
import 'package:pointfree/src/theme_type_provider.dart';
import 'package:lambda_cloud_dart_sdk/lambda_cloud_dart_sdk.dart';

const noneItemId = '__none__';

class CreateFilesystemPage extends StatefulWidget {
  const CreateFilesystemPage({super.key});

  @override
  State<CreateFilesystemPage> createState() => _CreateFilesystemPageState();
}

class _CreateFilesystemPageState extends State<CreateFilesystemPage> {
  final _filesystemRepository = FilesystemsRepository.instance;
  String? _name;
  PublicRegionCode? _regionCode;

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;
    switch (themeType) {
      case ThemeType.cupertino:
        return CupertinoCreateFilesystemPage(
          name: _name,
          onNameChange: (v) => setState(() => _name = v),
          regionCode: _regionCode,
          onRegionCodeChange: (v) => setState(() => _regionCode = v),
          onLaunchPressed: _launchHandler(),
        );
      default:
        return MaterialCreateFilesystemPage(
          name: _name,
          onNameChange: (v) => setState(() => _name = v),
          regionCode: _regionCode,
          onRegionCodeChange: (v) => setState(() => _regionCode = v),
          onLaunchPressed: _launchHandler(),
        );
    }
  }

  void Function()? _launchHandler() {
    if (_name == null || _regionCode == null) {
      return null;
    }

    return () async {
      await _filesystemRepository.create(name: _name!, region: _regionCode!);

      if (mounted) {
        context.pop();
      }
    };
  }
}
