import 'package:flutter/material.dart';
import 'package:pointfree/src/firewall/create.dart';

class PortRangeDialog extends StatefulWidget {
  const PortRangeDialog({super.key, required PortRange initialPortRange})
      : _initialPortRange = initialPortRange;

  final PortRange _initialPortRange;

  @override
  State<PortRangeDialog> createState() => _PortRangeDialogState();
}

class _PortRangeDialogState extends State<PortRangeDialog> {
  final _nameFormKey = GlobalKey<FormState>();
  PortRange _portRange = PortRange.single(0);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Port range'),
      content: Form(
        key: _nameFormKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: widget._initialPortRange.start.toString(),
              keyboardType: TextInputType.number,
              validator: portNumberValidator,
              onSaved: (newValue) {
                if (newValue == null) return;
                _portRange = PortRange(int.parse(newValue), _portRange.end);
              },
            ),
            TextFormField(
              initialValue: widget._initialPortRange.end.toString(),
              keyboardType: TextInputType.number,
              validator: portNumberValidator,
              onSaved: (newValue) {
                if (newValue == null) return;
                _portRange = PortRange(_portRange.start, int.parse(newValue));
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: _onSetPortRange,
          child: Text('Set'),
        ),
      ],
    );
  }

  void _onSetPortRange() {
    _nameFormKey.currentState!.save();
    Navigator.of(context).pop(_portRange);
  }
}
