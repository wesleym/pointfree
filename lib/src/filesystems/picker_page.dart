import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/filesystems/repository.dart';
import 'package:pointfree/src/instances/launch.dart';
import 'package:pointfree/src/platform/circular_progress_indicator.dart';
import 'package:pointfree/src/platform/icon_button.dart';
import 'package:pointfree/src/platform/icons.dart';
import 'package:pointfree/src/platform/list_tile.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/theme_type_provider.dart';
import 'package:openapi/api.dart';

class FilesystemsPickerPage extends StatelessWidget {
  final _filesystemsRepository = FilesystemsRepository();
  final PublicRegionCode regionCode;

  FilesystemsPickerPage({super.key, required this.regionCode});

  @override
  Widget build(BuildContext context) {
    unawaited(_filesystemsRepository.update());

    final themeType = ThemeTypeProvider.of(context).themeType;

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Filesystem')),
      body: StreamBuilder(
        initialData: _filesystemsRepository.filesystems,
        stream: _filesystemsRepository.stream,
        builder: (context, snapshot) {
          final error = snapshot.error;
          if (error != null) {
            // TODO: log to server to determine how best to present common errors.
            return CustomScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              slivers: [
                CupertinoSliverRefreshControl(
                  onRefresh: () => _filesystemsRepository.update(force: true),
                ),
                SliverFillRemaining(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: $error'),
                      PlatformIconButton(
                        onPressed: () =>
                            _filesystemsRepository.update(force: true),
                        icon: Icon(PlatformIcons.refresh(themeType)),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          final data = snapshot.data;
          if (data == null) {
            return CustomScrollView(
              slivers: [
                CupertinoSliverRefreshControl(
                  onRefresh: () => _filesystemsRepository.update(force: true),
                ),
                PlatformCircularProgressIndicator(),
              ],
            );
          }

          final filesystemsInRegion = snapshot.data!
              .where((element) => element.region.name == regionCode)
              .toList(growable: false);
          return CustomScrollView(
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
                      context,
                      filesystemsInRegion[index - 1].id,
                    ),
                    title: Text(filesystemsInRegion[index - 1].name),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void _onSelectFilesystem(BuildContext context, String filesystemId) =>
      context.pop(filesystemId);
}
