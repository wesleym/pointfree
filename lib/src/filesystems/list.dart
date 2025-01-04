import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lambda_gui/src/filesystems/repository.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/top_bar_sliver.dart';

class FilesystemsList extends StatelessWidget {
  final _repository = FilesystemsRepository.instance;

  FilesystemsList({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_repository.update());

    return StreamBuilder(
      initialData: _repository.filesystems,
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
              PlatformTopBarSliver(title: Text('Filesystems')),
              SliverList.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) =>
                    PlatformListTile(title: Text(data[index].name)),
              ),
            ],
          ),
        );
      },
    );
  }
}
