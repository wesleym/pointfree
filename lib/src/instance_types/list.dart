import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';

class InstanceTypesList extends StatelessWidget {
  final _instanceTypesRepository = InstanceTypesRepository.instance;

  InstanceTypesList({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Instance Type')),
      body: StreamBuilder(
        initialData: _instanceTypesRepository.instances,
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
                return PlatformListTile(
                    title: Text(data[index].instanceType.name));
              },
            ),
          );
        },
      ),
    );
  }
}
