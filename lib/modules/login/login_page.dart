import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/core/core.dart';
import 'package:split_it/modules/login/login_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                LoginButtonWidget(image: AppImages.google, label: 'Entrar com Google',
                    onPressed: () async{
                      GoogleSignIn _googleSignIn = GoogleSignIn(
                        scopes: [
                          'email',
                        ],);
                      try {
                        final response = await _googleSignIn.signIn();
                        print(response);
                      } catch (e){
                        print(e);
                      }
                    }),
                SizedBox(height: 20),
                LoginButtonWidget(image: AppImages.apple, label: 'Entrar com Apple',
                    onPressed: (){}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
