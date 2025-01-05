import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_gui/src/instance_types/repository.dart';

class InstanceTypesPickerDialog extends StatelessWidget {
  final _instanceTypesRepository = InstanceTypesRepository.instance;

  InstanceTypesPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_instanceTypesRepository.update());

    return StreamBuilder(
      initialData: _instanceTypesRepository.instanceTypes,
      stream: _instanceTypesRepository.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // TODO: Error handling.
          return Center(child: CircularProgressIndicator.adaptive());
        }

        final options = snapshot.data!
            .map(
              (e) => SimpleDialogOption(
                onPressed: () =>
                    _onSelectInstanceType(context, e.instanceType.name),
                child: Text(e.instanceType.description),
              ),
            )
            .toList(growable: false);

        return SimpleDialog(
          title: Text('Instance Type'),
          children: options,
        );
      },
    );
  }

  void _onSelectInstanceType(BuildContext context, String instanceTypeName) =>
      context.pop(instanceTypeName);
}
