import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/instances/repository.dart';
import 'package:lambda_gui/src/platform/icon_button.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';

class InstancesList extends StatelessWidget {
  final _repository = InstancesRepository.instance;

  InstancesList({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_repository.update());

    return StreamBuilder(
      initialData: _repository.instances,
      stream: _repository.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // TODO: Error handling.
          return Center(child: CircularProgressIndicator.adaptive());
        }

        final data = snapshot.data!;
        return RefreshIndicator.adaptive(
          onRefresh: () => _repository.update(force: true),
          child: CustomScrollView(
            slivers: [
              // TODO: Make platform icons.
              PlatformTopBarSliver(
                title: Text('Instances'),
                action: PlatformIconButton(
                  onPressed: () => context.go('/instances/launch'),
                  icon: Icon(CupertinoIcons.add_circled),
                ),
              ),
              SliverList.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Dismissible(
                    onDismissed: (direction) =>
                        _repository.terminate(data[index].id),
                    key: ValueKey(data[index].id),
                    child: PlatformListTile(
                        title: Text(data[index].name ?? data[index].id)),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
