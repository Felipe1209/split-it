import 'package:flutter/material.dart';
import 'package:split_it/modules/login/login_page.dart';
import 'package:split_it/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Split.it',
      initialRoute: '/login',
      routes:{
        '/splash' : (context) => SplashPage(),
        '/login' : (context) => LoginPage()
      }
    );
  }
}
