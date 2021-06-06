import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/home/widgets/money_icon_widget.dart';

class InfoCardWidget extends StatelessWidget {
  final MoneyIconType type;
  final TextStyle textStyle;
  final String label;
  final double value;
  final bool isLoading;

  const InfoCardWidget({
    Key? key,
    required this.textStyle,
    required this.label,
    required this.value,
    required this.type,
    this.isLoading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.infoCardBorder),
        borderRadius: BorderRadius.circular(10)
      ),
      width: 156,
      height: 168,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoneyIconWidget(type: type),
            SizedBox(height: 40),
            Text(label, style: AppTextStyles.infoCardTitle),
            SizedBox(height: 4),
            if(!isLoading) ...[
              SizedBox(
                width: 136,
                height: 24,
                child: Shimmer.fromColors(
                  baseColor: AppColors.loadingMoneyHigh,
                  highlightColor: AppColors.loadingMoneyBase,
                  child: Container(
                    color: AppColors.white,
                  )
                ),
              )
            ]
            else ...[
            Text('R\$ $value', style: textStyle)
            ]
          ]),
      ),
    );
  }
}
