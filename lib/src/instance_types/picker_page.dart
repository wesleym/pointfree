import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';

class InstanceTypesPickerPage extends StatelessWidget {
  final _instanceTypesRepository = InstanceTypesRepository.instance;

  InstanceTypesPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Instance Type')),
      body: StreamBuilder(
        initialData: _instanceTypesRepository.instanceTypes,
        stream: _instanceTypesRepository.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // TODO: Error handling.
            return Center(child: CircularProgressIndicator.adaptive());
          }

          final data = snapshot.data!;
          return RefreshIndicator.adaptive(
            onRefresh: () => _instanceTypesRepository.update(force: true),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                var description = data[index].instanceType.description;
                return PlatformListTile(
                  onTap: () => _onSelectInstanceType(
                      context, data[index].instanceType.name),
                  title: Text(description),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _onSelectInstanceType(BuildContext context, String instanceTypeName) =>
      context.pop(instanceTypeName);
}
