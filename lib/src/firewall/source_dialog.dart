import 'package:flutter/material.dart';

class SourceDialog extends StatefulWidget {
  const SourceDialog({super.key, String? initialSource})
    : _initialSource = initialSource ?? '';

  final String _initialSource;

  @override
  State<SourceDialog> createState() => _SourceDialogState();
}

class _SourceDialogState extends State<SourceDialog> {
  final _sourceFormKey = GlobalKey<FormState>();
  String _source = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Source'),
      content: Form(
        key: _sourceFormKey,
        child: TextFormField(
          initialValue: widget._initialSource,
          onSaved: (newValue) => _source = newValue ?? '',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(onPressed: _handleSet, child: Text('Set')),
      ],
    );
  }

  void _handleSet() {
    _sourceFormKey.currentState!.save();
    Navigator.of(context).pop(_source);
  }
}
