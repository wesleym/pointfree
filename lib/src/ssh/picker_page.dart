import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

class SshKeyPickerPage extends StatelessWidget {
  final _repository = SshKeysRepository();

  SshKeyPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_repository.update());

    final themeType = ThemeTypeProvider.of(context);

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('SSH Key')),
      body: StreamBuilder(
        initialData: _repository.sshKeys,
        stream: _repository.stream,
        builder: (context, snapshot) {
          final error = snapshot.error;
          if (error != null) {
            // TODO: log to server to determine how best to present common errors.
            return Center(
              child: Column(children: [
                Text('Error: $error'),
                FilledButton(
                  onPressed: () => _repository.update(force: true),
                  child: Text('Reload'),
                ),
              ]),
            );
          }

          final data = snapshot.data;
          if (data == null) {
            return Center(child: PlatformCircularProgressIndicator());
          }

          var scrollView = CustomScrollView(slivers: [
            if (themeType == ThemeType.cupertino)
              CupertinoSliverRefreshControl(),
            SliverList.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return PlatformListTile(
                  onTap: () => _onSelectSshKey(context, data[index].id),
                  title: Text(data[index].name),
                );
              },
            ),
          ]);

          if (themeType == ThemeType.cupertino) {
            return scrollView;
          } else {
            return RefreshIndicator(
              onRefresh: () => _repository.update(force: true),
              child: scrollView,
            );
          }
        },
      ),
    );
  }

  void _onSelectSshKey(BuildContext context, String sshKeyId) =>
      context.pop(sshKeyId);
}
