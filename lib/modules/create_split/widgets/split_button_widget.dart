import 'package:flutter/material.dart';

class SplitButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final TextStyle style;

  const SplitButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
          onPressed: onPressed,
          child: Text(label, style: style)));
  }
}
