import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';

class StepOnePage extends StatefulWidget {
  final void Function(String value) onChanged;

  const StepOnePage({
    Key? key,
    required this.onChanged
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
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: [
                TextSpan(text: 'Qual o nome\n', style: AppTextStyles.stepOneTitle),
                TextSpan(text: 'do evento?', style: AppTextStyles.stepOneSubtitle)
              ]
        )),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 64),
          child: TextField(
            onChanged: widget.onChanged,
            style: AppTextStyles.stepOneTextField,
            textAlign: TextAlign.center,
            cursorColor: AppColors.black,
            decoration: InputDecoration(
              hintText: 'Ex: Churrasco',
              hintStyle: AppTextStyles.stepOneHint,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFieldBorder)
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.textFieldBorder)
              )
            ),
          ),
        )
      ],
    );
  }
}
