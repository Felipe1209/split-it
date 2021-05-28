import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/splash/image_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: AppGradients.background
        ),
        child: SafeArea(
          top: true,
          bottom: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 24),
              ImageWidget(
                opacity: 0.4,
                alignment: Alignment.centerLeft,
                image: AppImages.retanguloDir, height: 98, width: 198),
              ImageWidget(
                opacity: 0.4,
                alignment: Alignment.centerLeft,
                image: AppImages.retanguloDir, height: 54 , width: 114),
              ImageWidget(
                opacity: 1,
                alignment: Alignment.center,
                image: AppImages.logo, height: 112, width: 128),
              ImageWidget(
                opacity: 0.4,
                alignment: Alignment.centerRight,
                image: AppImages.retanguloEsq, height: 54, width: 114),
              ImageWidget(
                opacity: 0.4,
                alignment: Alignment.centerRight,
                image: AppImages.retanguloEsq, height: 98, width: 198),
              SizedBox(height: 24)
            ],
          ),
        ),
      ),
    );
  }
}
