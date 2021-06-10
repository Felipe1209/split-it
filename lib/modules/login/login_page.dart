import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/login/widgets/login_button_widget.dart';
import 'package:split_it/modules/login/login_controller.dart';
import 'package:split_it/modules/login/login_service.dart';
import 'package:split_it/modules/login/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(service: LoginServiceImpl());
    autorun((_){
      if(controller.state is LoginStateSuccess){
        final user = (controller.state as LoginStateSuccess).user;
        Navigator.pushReplacementNamed(context, '/home', arguments: user);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Divida\nsuas contas\ncom seus\namigos', style: AppTextStyles.loginTitle),
            Column(
              children: [
                ListTile(
                  leading: Image.asset(AppImages.emoji),
                  title: Text('Faça seu login com\numa das contas abaixo', style: AppTextStyles.loginButtons),
                ),
                SizedBox(height: 40),
                Observer(builder: (context){
                  if(controller.state is LoginStateLoading) {
                    return CircularProgressIndicator();
                  }
                  else if (controller.state is LoginStateFailure) {
                    return Column(
                      children: [
                        Text((controller.state as LoginStateFailure).message),
                        LoginButtonWidget(
                            image: AppImages.google,
                            label: 'Entrar com Google',
                            onPressed: () => controller.googleSignIn()
                        )
                      ],
                    );
                  }
                  else{
                   return LoginButtonWidget(
                     image: AppImages.google,
                     label: 'Entrar com Google',
                     onPressed: () => controller.googleSignIn()
                    );
                  //TODO: REALIZAR A CONFIGURAÇÃO DO BOTÃO LOGIN APPLE
                  /*LoginButtonWidget(image: AppImages.apple, label: 'Entrar com Apple',
                    onPressed: (){}),*/
                  }
                })
            ])
        ]),
    ));
  }
}
