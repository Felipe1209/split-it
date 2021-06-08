import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';

class StepTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const StepTitleWidget({
    Key? key,
    required this.title,
    required this.subtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(text: '$title\n', style: AppTextStyles.stepsTitle),
              TextSpan(text: '$subtitle', style: AppTextStyles.stepsSubtitle)
            ]
        ));
  }
}
