import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/home/widgets/appbar/appbar_controller.dart';
import 'info_card_widget.dart';
import '../money_icon_widget.dart';
import 'appbar_state.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({Key? key}) : super(key: key);

  @override
  _BottomAppBarWidgetState createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {
  final controller = AppBarController();

  @override
  void initState() {
    controller.getDashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context){
      switch (controller.state.runtimeType) {
        case AppBarStateLoading:
          {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCardWidget(
                    type: MoneyIconType.receive,
                    label: 'A receber',
                    value: 0,
                    textStyle: AppTextStyles.infoCardReceive
                ),
                InfoCardWidget(
                    type: MoneyIconType.send,
                    label: 'A pagar',
                    value: 0,
                    textStyle: AppTextStyles.infoCardGive
                ),
              ],
            );
          }
        case AppBarStateFailure:
          {
            return Text((controller.state as AppBarStateFailure).message);
          }
        case AppBarStateSuccess:
          {
            final dashboard = (controller.state as AppBarStateSuccess).dashboard;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCardWidget(
                  type: MoneyIconType.receive,
                  label: 'A receber',
                  value: dashboard.receive,
                  textStyle: AppTextStyles.infoCardReceive,
                  isLoading: true,
                ),
                InfoCardWidget(
                  type: MoneyIconType.send,
                  label: 'A pagar',
                  value: dashboard.send,
                  textStyle: AppTextStyles.infoCardGive,
                  isLoading: true,
                ),
              ],
            );
          }
        default:
          {
            return Container();
          }
      }
    });

  }
}
