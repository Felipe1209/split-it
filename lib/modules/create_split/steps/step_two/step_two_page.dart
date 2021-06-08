import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/person_tile_widget.dart';
import 'package:split_it/modules/create_split/widgets/step_input_widget.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepTwoPage extends StatefulWidget {
  final void Function(String) onChanged;

  const StepTwoPage({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 39),
      StepTitleWidget(title: 'Com quem', subtitle: 'você quer dividir?'),
      StepInputTextWidget(onChanged: widget.onChanged, hintText: 'Nome da pessoa'),
      SizedBox(height: 35),
      PersonTileWidget(name: 'José'),
      PersonTileWidget(name: 'Maria'),
      PersonTileWidget(name: 'Fernanda')

    ]);
  }
}
