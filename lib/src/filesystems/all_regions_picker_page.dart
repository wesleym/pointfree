import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:openapi/api.dart';

class AllRegionsPickerPage extends StatelessWidget {
  AllRegionsPickerPage({super.key});

  final _instanceTypesRepository = InstanceTypesRepository.instance;

  @override
  Widget build(BuildContext context) {
    final regions = PublicRegionCode.values;

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Instance Type')),
      body: RefreshIndicator.adaptive(
        onRefresh: () => _instanceTypesRepository.update(force: true),
        child: ListView.builder(
          itemCount: regions.length,
          itemBuilder: (BuildContext context, int index) {
            return PlatformListTile(
              onTap: () => _onSelectRegion(context, regions[index]),
              title: Text(regions[index].value),
            );
          },
        ),
      ),
    );
  }

  void _onSelectRegion(BuildContext context, PublicRegionCode regionCode) =>
      context.pop(regionCode);
}
