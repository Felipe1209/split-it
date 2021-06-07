import 'package:flutter/material.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/step_one/step_one_page.dart';
import 'package:split_it/modules/create_split/widgets/split_button_widget.dart';
import 'widgets/split_appbar_widget.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final CreateSplitController controller = CreateSplitController();

  late List<Widget> pages;

  bool enabledButtons = false;
  int index = 0;

  void nextPage(){
    index++;
    setState(() {});
  }

  void backPage(){
    if (index > 0){
      index--;
      setState(() {});
    }else{
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    pages = [
      StepOnePage(onChanged: (String value) {
        controller.setEventName(value);
        enabledButtons = controller.enableButtons();
        setState(() {});
      }),
      Container(),
      Container()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SplitAppBarWidget(
        onPressed: backPage,
        labelPrimary: '0${index + 1}',
        labelSecondary: ' - 0${pages.length}',
      ),

      body: pages[index],

      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Container(
          height: 56,
          child: Row(children: [
            SplitButtonWidget(
                onPressed: enabledButtons ? () => Navigator.pop(context) : null,
                label: 'CANCELAR',
                style: enabledButtons ? AppTextStyles.splitButtons : AppTextStyles.splitButtonsDisabled
            ),
            Container(width: 1, height: double.maxFinite, color: AppColors.infoCardBorder),
            if(index < pages.length - 1) ...[
              SplitButtonWidget(
                  onPressed: enabledButtons ? nextPage : null,
                  label: 'CONTINUAR',
                  style: enabledButtons ? AppTextStyles.splitButtons : AppTextStyles.splitButtonsDisabled
              ),
            ]
            else ...[
              SplitButtonWidget(
                  onPressed: () => Navigator.pop(context),
                  label: 'FINALIZAR',
                  style: AppTextStyles.splitButtonsFinal
              ),
            ]
          ]),
        ),
      )
    );
  }
}
