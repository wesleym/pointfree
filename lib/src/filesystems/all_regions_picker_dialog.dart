import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lambda_cloud_dart_sdk/lambda_cloud_dart_sdk.dart';

class AllRegionsPickerDialog extends StatelessWidget {
  const AllRegionsPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Instance Type'),
      children: PublicRegionCode.values
          .map(
            (e) => SimpleDialogOption(
              onPressed: () => _onSelectRegion(context, e),
              child: Text(e.value),
            ),
          )
          .toList(growable: false),
    );
  }

  void _onSelectRegion(BuildContext context, PublicRegionCode regionCode) =>
      context.pop(regionCode);
}
