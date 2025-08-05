import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/images/repository.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';
import 'package:openapi/api.dart' as api;

class ImagePickerPage extends StatelessWidget {
  final _imagesRepository = ImagesRepository.instance;

  ImagePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_imagesRepository.update());

    final themeType = ThemeTypeProvider.of(context);

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Instance Type')),
      body: StreamBuilder(
        initialData: _imagesRepository.images,
        stream: _imagesRepository.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // TODO: Error handling.
            return Center(child: PlatformCircularProgressIndicator());
          }

          final data = snapshot.data!;
          var listView = CustomScrollView(
            slivers: [
              if (themeType == ThemeType.cupertino)
                CupertinoSliverRefreshControl(),
              SliverList.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  var description = '${data[index].family} (${data[index].id})';
                  return PlatformListTile(
                    onTap: () => _onSelectImage(context, data[index]),
                    title: Text(description),
                  );
                },
              ),
            ],
          );

          if (themeType == ThemeType.cupertino) {
            return listView;
          } else {
            return RefreshIndicator(
              onRefresh: () => _imagesRepository.update(force: true),
              child: listView,
            );
          }
        },
      ),
    );
  }

  void _onSelectImage(BuildContext context, api.Image image) =>
      context.pop(image);
}
