import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/create_split/widgets/step_input_widget.dart';
import 'package:split_it/modules/create_split/widgets/step_title_widget.dart';

class StepThreePage extends StatefulWidget {
  const StepThreePage({Key? key}) : super(key: key);

  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 39),
      StepTitleWidget(title: 'Quais itens', subtitle: 'você quer dividir?'),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 24),
              child: Text('1'),
            ),
            Expanded(
              flex: 3,
              child: StepInputTextWidget(
                align: TextAlign.start,
                hintText: 'Ex: Picanha',
                padding: EdgeInsets.zero,
                onChanged: (value){},
            )),
            Expanded(
              flex: 2,
              child: StepInputTextWidget(
                align: TextAlign.start,
                hintText: 'R\$ 0,00',
                padding: EdgeInsets.zero,
                textType: TextInputType.number,
                onChanged: (value){},
            )),
            IconButton(
              icon: Icon(Icons.delete),
              color: AppColors.grey,
              onPressed: (){},
            )
          ],
        ),
      )
    ]);
  }
}
