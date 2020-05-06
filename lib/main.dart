import 'package:flutter/material.dart';
import 'package:github_profiler/Constant/Constant.dart';
import 'package:github_profiler/UI/login_screen.dart';
import 'package:github_profiler/splash/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreenAnimation(),
        HOME_SCREEN: (BuildContext context) => Login(),
      },
      home: SplashScreenAnimation(),
    );
  }
}
