import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/api.dart';

class ProtocolPickerDialog extends StatelessWidget {
  const ProtocolPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text('Protocol'),
      children: SecurityGroupRuleProtocol.values
          .map((e) => SimpleDialogOption(
                onPressed: () => _onSelectProtocol(context, e),
                child: Text(e.value),
              ))
          .toList(growable: false),
    );
  }

  void _onSelectProtocol(
          BuildContext context, SecurityGroupRuleProtocol protocol) =>
      context.pop(protocol);
}
