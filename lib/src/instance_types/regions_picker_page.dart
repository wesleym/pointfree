import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';
import 'package:openapi/api.dart';

class RegionsPickerPage extends StatelessWidget {
  RegionsPickerPage({super.key, required this.instanceType});

  final _instanceTypesRepository = InstanceTypesRepository.instance;
  final String instanceType;

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    final themeType = ThemeTypeProvider.of(context);

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Region')),
      body: StreamBuilder(
        initialData: _instanceTypesRepository.instanceTypes,
        stream: _instanceTypesRepository.stream,
        builder: (context, snapshot) {
          final thisInstanceType = instanceType;
          final List<Region>? regions;
          regions = snapshot.data
              ?.where(
                  (element) => element.instanceType.name == thisInstanceType)
              .singleOrNull
              ?.regionsWithCapacityAvailable;

          if (regions == null) {
            // TODO: Error handling.
            return Center(child: PlatformCircularProgressIndicator());
          }

          var scrollView = CustomScrollView(
            slivers: [
              if (themeType == ThemeType.cupertino)
                CupertinoSliverRefreshControl(),
              SliverList.builder(
                itemCount: regions.length,
                itemBuilder: (BuildContext context, int index) {
                  return PlatformListTile(
                    onTap: () => _onSelectRegion(context, regions![index].name),
                    title: Text(regions![index].description),
                  );
                },
              ),
            ],
          );

          if (themeType == ThemeType.cupertino) {
            return scrollView;
          } else {
            return RefreshIndicator(
              onRefresh: () => _instanceTypesRepository.update(force: true),
              child: scrollView,
            );
          }
        },
      ),
    );
  }

  void _onSelectRegion(BuildContext context, PublicRegionCode regionCode) =>
      context.pop(regionCode);
}
