import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/ssh/repository.dart';

class SshKeyPickerDialog extends StatelessWidget {
  final _repository = SshKeysRepository();

  SshKeyPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_repository.update());

    return StreamBuilder(
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

        final options = data
            .map((key) => SimpleDialogOption(
                  child: Text(key.name),
                  onPressed: () => _onSshKeyPressed(context, key.id),
                ))
            .toList(growable: false);

        return SimpleDialog(title: Text('SSH Keys'), children: options);
      },
    );
  }

  void _onSshKeyPressed(BuildContext context, String sshKeyId) =>
      context.pop(sshKeyId);
}
