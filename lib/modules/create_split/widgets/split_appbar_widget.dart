import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';

class SplitAppBarWidget extends PreferredSize{
  final VoidCallback onPressed;
  final CreateSplitController controller;
  final int pages;

  SplitAppBarWidget({
    required this.onPressed,
    required this.controller,
    required this.pages
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
            Observer(builder: (_){
              return RichText(
                text: TextSpan(
                    children: [
                      TextSpan(text: '0${controller.currentPage + 1}', style: AppTextStyles.stepperIndicatorPrimary),
                      TextSpan(text: ' - 0$pages', style: AppTextStyles.stepperIndicatorSecondary)
                    ]
              ));
            })
          ],
        ),
      ),
    )
  );

}