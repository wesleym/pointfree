import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pointfree/src/images/repository.dart';
import 'package:pointfree/src/platform/circular_progress_indicator.dart';
import 'package:openapi/api.dart' as api;

class ImagePickerDialog extends StatelessWidget {
  final _imagesRepository = ImagesRepository.instance;

  ImagePickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    unawaited(_imagesRepository.update());

    return StreamBuilder(
      initialData: _imagesRepository.images,
      stream: _imagesRepository.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // TODO: Error handling.
          return Center(child: PlatformCircularProgressIndicator());
        }

        final options = snapshot.data!
            .map(
              (e) => SimpleDialogOption(
                onPressed: () => _onSelectInstanceType(context, e),
                child: Text('${e.family} (${e.id})'),
              ),
            )
            .toList(growable: false);

        return SimpleDialog(
          title: Text('Image'),
          children: options,
        );
      },
    );
  }

  void _onSelectInstanceType(BuildContext context, api.Image image) =>
      context.pop(image);
}
