import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';

class FilesystemsPickerDialog extends StatelessWidget {
  final _filesystemsRepository = FilesystemsRepository();

  FilesystemsPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_filesystemsRepository.update());

    return StreamBuilder(
      initialData: _filesystemsRepository.filesystems,
      stream: _filesystemsRepository.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // TODO: Error handling.
          return CircularProgressIndicator.adaptive();
        }

        final options = snapshot.data!
            .map((e) => SimpleDialogOption(
                  child: Text(e.name),
                  onPressed: () => _onFilesystemPressed(context, e.id),
                ))
            .toList(growable: false);
        return SimpleDialog(title: Text('Filesystem'), children: options);
      },
    );
  }

  void _onFilesystemPressed(BuildContext context, String filesystemId) =>
      context.pop(filesystemId);
}
