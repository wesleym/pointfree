import 'package:flutter/material.dart';

class DescriptionDialog extends StatefulWidget {
  const DescriptionDialog({super.key, String? initialDescription})
      : _initialDescription = initialDescription ?? '';

  final String _initialDescription;

  @override
  State<DescriptionDialog> createState() => _DescriptionDialogState();
}

class _DescriptionDialogState extends State<DescriptionDialog> {
  final _descriptionFormKey = GlobalKey<FormState>();
  String _description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Description'),
      content: Form(
        key: _descriptionFormKey,
        child: TextFormField(
          initialValue: widget._initialDescription,
          onSaved: (newValue) => _description = newValue ?? '',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: _handleSet,
          child: Text('Set'),
        ),
      ],
    );
  }

  void _handleSet() {
    _descriptionFormKey.currentState!.save();
    Navigator.of(context).pop(_description);
  }
}
