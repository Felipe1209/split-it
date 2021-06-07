import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';

class SplitAppBarWidget extends PreferredSize{
  final VoidCallback onPressed;
  final String labelPrimary;
  final String labelSecondary;

  SplitAppBarWidget({
    required this.onPressed,
    required this.labelPrimary,
    required this.labelSecondary
  }) : super(
    preferredSize: Size.fromHeight(60),
    child: SafeArea(
      top: true,
      child: Padding(
        padding: const EdgeInsets.only(right: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(icon: Icon(Icons.arrow_back, color: AppColors.grey), onPressed: onPressed),
            RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: labelPrimary, style: AppTextStyles.stepperIndicatorPrimary),
                      TextSpan(text: labelSecondary, style: AppTextStyles.stepperIndicatorSecondary)
                    ]
            ))
          ],
        ),
      ),
    )
  );

}