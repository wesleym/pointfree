import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/instances/launch.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';

class FilesystemsPickerPage extends StatelessWidget {
  final _filesystemsRepository = FilesystemsRepository();
  final String regionCode;

  FilesystemsPickerPage({super.key, required this.regionCode});

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

          final filesystemsInRegion = snapshot.data!
              .where((element) => element.region.name == regionCode)
              .toList(growable: false);
          return RefreshIndicator.adaptive(
            onRefresh: () => _filesystemsRepository.update(force: true),
            child: ListView.builder(
              itemCount: filesystemsInRegion.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return PlatformListTile(
                    onTap: () => _onSelectFilesystem(context, noneItemId),
                    title: Text('Do not attach a filesystem'),
                  );
                }
                return PlatformListTile(
                  onTap: () => _onSelectFilesystem(
                      context, filesystemsInRegion[index - 1].id),
                  title: Text(filesystemsInRegion[index - 1].name),
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
