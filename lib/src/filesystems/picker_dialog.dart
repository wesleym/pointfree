import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/instances/launch.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:openapi/api.dart';

class FilesystemsPickerDialog extends StatelessWidget {
  final _filesystemsRepository = FilesystemsRepository();
  final PublicRegionCode regionCode;

  FilesystemsPickerDialog({super.key, required this.regionCode});

  @override
  Widget build(BuildContext context) {
    unawaited(_filesystemsRepository.update());

    return StreamBuilder(
      initialData: _filesystemsRepository.filesystems,
      stream: _filesystemsRepository.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // TODO: Error handling.
          return PlatformCircularProgressIndicator();
        }

        final options = (snapshot.data!)
            .where((element) => element.region.name == regionCode)
            .map((e) => SimpleDialogOption(
                  onPressed: () => _onFilesystemPressed(context, e.id),
                  child: Text(e.name),
                ));
        var noneOption = SimpleDialogOption(
          onPressed: () => _onFilesystemPressed(context, noneItemId),
          child: Text('Do not attach a filesystem'),
        );
        return SimpleDialog(
          title: Text('Filesystem'),
          children: [noneOption, ...options],
        );
      },
    );
  }

  void _onFilesystemPressed(BuildContext context, String filesystemId) =>
      context.pop(filesystemId);
}
