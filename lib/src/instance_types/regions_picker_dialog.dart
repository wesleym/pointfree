import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/instance_types/repository.dart';
import 'package:pointfree/src/platform/circular_progress_indicator.dart';
import 'package:openapi/api.dart';

class RegionsPickerDialog extends StatelessWidget {
  RegionsPickerDialog({super.key, required this.instanceType});

  final _instanceTypesRepository = InstanceTypesRepository.instance;
  final String instanceType;

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    return StreamBuilder(
      initialData: _instanceTypesRepository.instanceTypes,
      stream: _instanceTypesRepository.stream,
      builder: (context, snapshot) {
        final thisInstanceType = instanceType;
        final List<Region>? regions;
        regions = snapshot.data
            ?.where((element) => element.instanceType.name == thisInstanceType)
            .singleOrNull
            ?.regionsWithCapacityAvailable;

        if (regions == null) {
          // TODO: Error handling.
          return PlatformCircularProgressIndicator();
        }

        final options = regions
            .map(
              (e) => SimpleDialogOption(
                onPressed: () => _onSelectRegion(context, e.name),
                child: Text(e.description),
              ),
            )
            .toList(growable: false);

        return SimpleDialog(title: Text('Instance Type'), children: options);
      },
    );
  }

  void _onSelectRegion(BuildContext context, PublicRegionCode regionCode) =>
      context.pop(regionCode);
}
