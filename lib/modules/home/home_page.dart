import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/widgets/appbar/appbar_widget.dart';
import 'package:split_it/modules/home/widgets/event_tile_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBarWidget(user: user, onTap: () => Navigator.pushNamed(context, '/create-split')),
      body: Observer(builder: (BuildContext context) {
        if(controller.state is HomeStateLoading){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text('Localizando seus eventos...', style: AppTextStyles.eventTileTitle)
            ]),
          );
        }
        else if(controller.state is HomeStateFailure){
          return Center(
            child: Text((controller.state as HomeStateFailure).message,
                style: AppTextStyles.infoCardTitle
          ));
        }
        else{
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: (controller.events.length == 0) ?
              Center(child: Text('Você ainda não possui eventos!', style: AppTextStyles.eventTileTitle,)) :
              ListView.builder(
                  itemCount: controller.events.length,
                  itemBuilder: (context, index){
                    return EventTileWidget(
                      event: controller.events[index],
                    );
                  }
          ));
        }
      })
    );
  }
}