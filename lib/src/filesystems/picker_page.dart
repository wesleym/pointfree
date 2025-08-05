import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/instances/launch.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';
import 'package:openapi/api.dart';

class FilesystemsPickerPage extends StatelessWidget {
  final _filesystemsRepository = FilesystemsRepository();
  final PublicRegionCode regionCode;

  FilesystemsPickerPage({super.key, required this.regionCode});

  @override
  Widget build(BuildContext context) {
    unawaited(_filesystemsRepository.update());

    final themeType = ThemeTypeProvider.of(context);

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Filesystem')),
      body: StreamBuilder(
        initialData: _filesystemsRepository.filesystems,
        stream: _filesystemsRepository.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // TODO: Error handling.
            return Center(child: PlatformCircularProgressIndicator());
          }

          final filesystemsInRegion = snapshot.data!
              .where((element) => element.region.name == regionCode)
              .toList(growable: false);
          var scrollView = CustomScrollView(
            slivers: [
              if (themeType == ThemeType.cupertino)
                CupertinoSliverRefreshControl(),
              SliverList.builder(
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
            ],
          );
          return RefreshIndicator(
            onRefresh: () => _filesystemsRepository.update(force: true),
            child: scrollView,
          );
        },
      ),
    );
  }

  void _onSelectFilesystem(BuildContext context, String filesystemId) =>
      context.pop(filesystemId);
}
