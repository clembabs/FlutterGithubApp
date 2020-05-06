import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_profiler/Constant/Constant.dart';

class SplashScreenAnimation extends StatefulWidget {
  @override
  _SplashScreenAnimationState createState() => _SplashScreenAnimationState();
}
// `SingleTickerProviderStateMixin`, `AnimationController`,`Animation`, they are very important to comply with our animation. 
// `SingleTickerProviderStateMixin` manages our animation time, `AnimationController` will manage our animation, such as start, stop. 
// Animation will recode our change value, and listen to our animation state.
class _SplashScreenAnimationState extends State<SplashScreenAnimation> with SingleTickerProviderStateMixin{
  
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

//Timer
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

//pushReplacementNamed won't allow you going back to that screen
  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }


//For the Animation
  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = new CurvedAnimation(parent: animationController, curve: Curves.easeOut);
  
    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Column(mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 30.0),)
          ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Image.asset('assets/GitHub-Mark-120px-plus.png',
              width: animation.value * 250,
                height: animation.value * 250,
              ),
            ]
          ),
           
        ]
      ),
      
    );
  }
}