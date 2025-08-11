import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/platform/circular_progress_indicator.dart';
import 'package:lambda_gui/src/platform/icon_button.dart';
import 'package:lambda_gui/src/platform/icons.dart';
import 'package:lambda_gui/src/ssh/repository.dart';
import 'package:lambda_gui/src/theme_type_provider.dart';

Widget createSshKeysDialog(List<Widget> children) =>
    SimpleDialog(title: Text('SSH Key'), children: children);

class SshKeyPickerDialog extends StatelessWidget {
  final _repository = SshKeysRepository();

  SshKeyPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_repository.update());

    final themeType = ThemeTypeProvider.of(context);

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
              IconButton(
                onPressed: () => _repository.update(force: true),
                icon: Icon(PlatformIcons.refresh(themeType)),
              ),
            ]),
          );
        }

        final data = snapshot.data;
        if (data == null) {
          return createSshKeysDialog([
            PlatformCircularProgressIndicator(),
            PlatformIconButton(
              onPressed: () => _repository.update(force: true),
              icon: Icon(PlatformIcons.refresh(themeType)),
            ),
          ]);
        }

        final options = data
            .map((key) => SimpleDialogOption(
                  child: Text(key.name),
                  onPressed: () => _onSshKeyPressed(context, key.id),
                ))
            .toList(growable: false);

        return createSshKeysDialog(options);
      },
    );
  }

  void _onSshKeyPressed(BuildContext context, String sshKeyId) =>
      context.pop(sshKeyId);
}
