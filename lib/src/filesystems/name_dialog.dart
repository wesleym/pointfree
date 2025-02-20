import 'package:flutter/material.dart';

class NameDialog extends StatefulWidget {
  const NameDialog({super.key, String? initialName})
      : _initialName = initialName ?? '';

  final String _initialName;

  @override
  State<NameDialog> createState() => _NameDialogState();
}

class _NameDialogState extends State<NameDialog> {
  final _nameFormKey = GlobalKey<FormState>();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filesystem name'),
      content: Form(
        key: _nameFormKey,
        child: TextFormField(
          initialValue: widget._initialName,
          onSaved: (newValue) => _name = newValue ?? '',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: _onSelectInstanceType,
          child: Text('Set'),
        ),
      ],
    );
  }

  void _onSelectInstanceType() {
    _nameFormKey.currentState!.save();
    Navigator.of(context).pop(_name);
  }
}
