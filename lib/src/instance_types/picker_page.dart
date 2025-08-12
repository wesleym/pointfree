import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/instance_types/repository.dart';
import 'package:pointfree/src/platform/circular_progress_indicator.dart';
import 'package:pointfree/src/platform/list_tile.dart';
import 'package:pointfree/src/platform/scaffold.dart';
import 'package:pointfree/src/theme_type_provider.dart';

class InstanceTypesPickerPage extends StatelessWidget {
  final _instanceTypesRepository = InstanceTypesRepository.instance;

  InstanceTypesPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    final themeType = ThemeTypeProvider.of(context);

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('Instance Type')),
      body: StreamBuilder(
        initialData: _instanceTypesRepository.instanceTypes,
        stream: _instanceTypesRepository.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // TODO: Error handling.
            return Center(child: PlatformCircularProgressIndicator());
          }

          final data = snapshot.data!;
          var scrollView = CustomScrollView(
            slivers: [
              if (themeType == ThemeType.cupertino)
                CupertinoSliverRefreshControl(),
              SliverList.builder(
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

  void _onSelectInstanceType(BuildContext context, String instanceTypeName) =>
      context.pop(instanceTypeName);
}
