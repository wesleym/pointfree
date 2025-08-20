import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pointfree/src/filesystems/create.dart';
import 'package:pointfree/src/filesystems/list.dart';
import 'package:pointfree/src/platform/icons.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class FilesystemsPage extends StatelessWidget {
  const FilesystemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;

    return PlatformScaffold(
      primaryActionIcon: Icon(PlatformIcons.add(themeType)),
      onPrimaryActionSelected: () => _onAddFilesystem(context),
      body: FilesystemsList(),
    );
  }

  void _onAddFilesystem(BuildContext context) {
    final themeType = ThemeTypeProvider.of(context).themeType;

    switch (themeType) {
      case ThemeType.cupertino:
        Navigator.of(context).push(
          CupertinoPageRoute(
            title: 'Filesystem',
            fullscreenDialog: true,
            builder: (context) => CreateFilesystemPage(),
          ),
        );
      case ThemeType.material:
      case ThemeType.lambda:
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => CreateFilesystemPage(),
          ),
        );
    }
  }
}
