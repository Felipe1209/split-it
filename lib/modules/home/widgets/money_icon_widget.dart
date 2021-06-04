import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';

enum MoneyIconType{receive, send}

class MoneyIconWidget extends StatelessWidget {
  final MoneyIconType type;

  const MoneyIconWidget({
    Key? key,
    required this.type
  }) : super(key: key);

  Object get image => type == MoneyIconType.receive ? AppImages.receiveMoney : AppImages.sendMoney;

  Color get backgroundColor => type == MoneyIconType.receive ? AppColors.greenSecondary : AppColors.redSecondary;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10)
      ),
      width: 48,
      height: 48,
      child: Image.asset(image.toString()),
    );
  }
}
