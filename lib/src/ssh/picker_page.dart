import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/platform/list_tile.dart';
import 'package:lambda_gui/src/platform/scaffold.dart';
import 'package:lambda_gui/src/ssh/repository.dart';

class SshKeyPickerPage extends StatelessWidget {
  final _sshKeysRepository = SshKeysRepository();

  SshKeyPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_sshKeysRepository.update());

    return PlatformScaffold(
      topBar: PlatformTopBar(title: Text('SSH Keys')),
      body: StreamBuilder(
        initialData: _sshKeysRepository.sshKeys,
        stream: _sshKeysRepository.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // TODO: Error handling.
            return Center(child: CircularProgressIndicator.adaptive());
          }

          final data = snapshot.data!;
          return RefreshIndicator.adaptive(
            onRefresh: () => _sshKeysRepository.update(force: true),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return PlatformListTile(
                  onTap: () => _onSelectSshKey(context, data[index].id),
                  title: Text(data[index].name),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _onSelectSshKey(BuildContext context, String sshKeyId) =>
      context.pop(sshKeyId);
}
