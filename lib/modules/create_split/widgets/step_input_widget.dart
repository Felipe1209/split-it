import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';

class StepInputTextWidget extends StatelessWidget {
  final void Function(String) onChanged;
  final String hintText;
  final TextAlign align;
  final EdgeInsets? padding;
  final TextInputType textType;

  const StepInputTextWidget({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.align = TextAlign.center,
    this.padding,
    this.textType = TextInputType.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 64),
      child: TextField(
        onChanged: onChanged,
        style: AppTextStyles.stepsTextField,
        textAlign: align,
        cursorColor: AppColors.black,
        keyboardType: textType,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.stepsHint,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFieldBorder)
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFieldBorder)
            )
        ),
      ),
    );
  }
}
