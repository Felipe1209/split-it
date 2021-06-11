import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/widgets/split_button_widget.dart';

class SplitBottomBarWidget extends StatelessWidget {
  final CreateSplitController controller;
  final VoidCallback onPressedNext;
  final VoidCallback onPressedCancel;

  const SplitBottomBarWidget({
    Key? key,
    required this.controller,
    required this.onPressedNext,
    required this.onPressedCancel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 56,
        child: Row(children: [
          Observer(builder: (_) => SplitButtonWidget(
              onPressed: onPressedCancel,
              label: 'CANCELAR',
              enabled: controller.enableButtons,
          )),
          Container(width: 1, height: double.maxFinite, color: AppColors.infoCardBorder),
          Observer(builder: (_) => SplitButtonWidget(
              onPressed: onPressedNext,
              label: 'CONTINUAR',
              enabled: controller.enableButtons,
          ))
        ]),
      ),
    );
  }
}
