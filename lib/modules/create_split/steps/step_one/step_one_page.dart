import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/widgets/step_input_widget.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepOnePage extends StatefulWidget {
  final CreateSplitController controller;

  const StepOnePage({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 39),
        StepTitleWidget(title: 'Qual o nome', subtitle: 'do evento?'),
        StepInputTextWidget(
            hintText: 'Ex: Churrasco',
            onChanged: (value){
              widget.controller.setEventName(value);
            })
      ],
    );
  }
}
