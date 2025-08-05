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
  final _sshKeysRepository = SshKeysRepository();

  SshKeyPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_sshKeysRepository.update());

    final themeType = ThemeTypeProvider.of(context);

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('SSH Keys')),
      body: StreamBuilder(
        initialData: _sshKeysRepository.sshKeys,
        stream: _sshKeysRepository.stream,
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
                  return PlatformListTile(
                    onTap: () => _onSelectSshKey(context, data[index].id),
                    title: Text(data[index].name),
                  );
                },
              ),
            ],
          );

          if (themeType == ThemeType.cupertino) {
            return scrollView;
          } else {
            return RefreshIndicator(
              onRefresh: () => _sshKeysRepository.update(force: true),
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
