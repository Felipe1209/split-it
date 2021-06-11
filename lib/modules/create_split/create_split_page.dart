import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/step_one/step_one_page.dart';
import 'package:split_it/modules/create_split/steps/step_three/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/step_two/step_two_page.dart';
import 'widgets/split_appbar_widget.dart';
import 'widgets/split_bottom_bar_widget.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(controller: controller),
      StepTwoPage(onChanged: (String value) {

      }),
      StepThreePage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SplitAppBarWidget(
        onPressed: (){
          if(controller.currentPage > 0){
            controller.backPage();
          } else{
            Navigator.pop(context);
          }
        },
        controller: controller,
        pages: pages.length,
      ),

      body: Observer(builder: (_) {
        final index = controller.currentPage;
        return pages[index];
      }),

      bottomNavigationBar: SplitBottomBarWidget(
        controller: controller,
        onPressedNext: (){
          if(pages.length == controller.currentPage + 1){
            Navigator.pop(context);
          } else {
            controller.nextPage();
          }
        },
        onPressedCancel: () {  },
      )
    );
  }
}