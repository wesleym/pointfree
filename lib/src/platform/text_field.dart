import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformTextField extends StatelessWidget {
  final TextEditingController? _controller;
  final void Function(String)? _onSubmitted;
  final bool _enabled;

  const PlatformTextField({
    super.key,
    TextEditingController? controller,
    void Function(String)? onSubmitted,
    bool enabled = true,
  })  : _controller = controller,
        _onSubmitted = onSubmitted,
        _enabled = enabled;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    switch (platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoTextField(
          controller: _controller,
          onSubmitted: _onSubmitted,
          enabled: _enabled,
        );
      default:
        return TextField(
          controller: _controller,
          onSubmitted: _onSubmitted,
          enabled: _enabled,
          // decoration: InputDecoration(
          //   border: const OutlineInputBorder(),
          //   suffixIcon: _inProgress
          //       ? Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: SizedBox.square(
          //               // dimension: (theme.iconTheme.size ?? 48) - 16,
          //               dimension: 32,
          //               child: const CircularProgressIndicator()),
          //         )
          //       : IconButton(
          //           onPressed: () => _sendMessage(_chatController.text),
          //           icon: const Icon(Icons.send),
          //         ),
          // ),
        );
    }
  }
}
