import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/ssh/repository.dart';

class SshKeyPickerDialog extends StatelessWidget {
  final _sshKeysRepository = SshKeysRepository();

  SshKeyPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_sshKeysRepository.update());

    return StreamBuilder(
        initialData: _sshKeysRepository.sshKeys,
        stream: _sshKeysRepository.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // TODO: Error handling.
            return PlatformCircularProgressIndicator();
          }

          final options = snapshot.data!
              .map((e) => SimpleDialogOption(
                    child: Text(e.name),
                    onPressed: () => _onSshKeyPressed(context, e.id),
                  ))
              .toList(growable: false);

          return SimpleDialog(title: Text('SSH Keys'), children: options);
        });
  }

  void _onSshKeyPressed(BuildContext context, String sshKeyId) =>
      context.pop(sshKeyId);
}
