import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/filesystems/repository.dart';
import 'package:pointfree/src/instances/launch.dart';
import 'package:openapi/api.dart';

Widget createFilesystemsDialog(List<Widget> children) =>
    SimpleDialog(title: Text('Filesystem'), children: children);

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
        final error = snapshot.error;
        if (error != null) {
          // TODO: log to server to determine how best to present common errors.
          return createFilesystemsDialog([
            Text('Error: $error'),
            IconButton(
              onPressed: () => _filesystemsRepository.update(force: true),
              icon: Icon(Icons.refresh),
            ),
          ]);
        }

        final data = snapshot.data;
        if (data == null) {
          return createFilesystemsDialog([
            CircularProgressIndicator(),
            IconButton(
              onPressed: () => _filesystemsRepository.update(force: true),
              icon: Icon(Icons.refresh),
            ),
          ]);
        }

        final options = (snapshot.data!)
            .where((element) => element.region.name == regionCode)
            .map(
              (e) => SimpleDialogOption(
                onPressed: () => _onFilesystemPressed(context, e.id),
                child: Text(e.name),
              ),
            );
        var noneOption = SimpleDialogOption(
          onPressed: () => _onFilesystemPressed(context, noneItemId),
          child: Text('Do not attach a filesystem'),
        );
        return createFilesystemsDialog([noneOption, ...options]);
      },
    );
  }

  void _onFilesystemPressed(BuildContext context, String filesystemId) =>
      context.pop(filesystemId);
}
