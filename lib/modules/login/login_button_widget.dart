import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';

class LoginButtonWidget extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onPressed;

  const LoginButtonWidget({
    Key? key,
    required this.image,
    required this.label,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      child: ElevatedButton.icon(
        icon: Image.asset(image),
        label: Text(label, style: AppTextStyles.loginButtons),
        style: ElevatedButton.styleFrom(
          primary: AppColors.white
        ),
        onPressed: onPressed,
      ),
    );
  }
}
