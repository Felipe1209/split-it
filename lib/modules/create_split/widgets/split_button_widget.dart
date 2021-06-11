import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';

class SplitButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool enabled;

  const SplitButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.enabled
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextButton(
          onPressed: enabled ? onPressed : null,
          child: Text(label, style: enabled
                ? AppTextStyles.splitButtons
                : AppTextStyles.splitButtonsDisabled)
        )
    );
  }
}
