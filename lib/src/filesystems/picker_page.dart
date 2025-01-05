import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';

class FilesystemsPickerPage extends StatelessWidget {
  final _filesystemsRepository = FilesystemsRepository();

  FilesystemsPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_filesystemsRepository.update());

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Filesystem')),
      body: StreamBuilder(
        initialData: _filesystemsRepository.filesystems,
        stream: _filesystemsRepository.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // TODO: Error handling.
            return Center(child: CircularProgressIndicator.adaptive());
          }

          final data = snapshot.data!;
          return RefreshIndicator.adaptive(
            onRefresh: () => _filesystemsRepository.update(force: true),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return PlatformListTile(
                  onTap: () => _onSelectFilesystem(context, data[index].id),
                  title: Text(data[index].name),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _onSelectFilesystem(BuildContext context, String filesystemId) =>
      context.pop(filesystemId);
}
