import 'dart:async';
import 'package:flutter/material.dart';

import '../auth/login_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {


  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, navigationPage);
  }



  //late SharedPreferences preferences;
  void navigationPage() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
  }

  @override
  void initState() {

    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE799AB),

      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/splash.png',
                //color: BROWN_COLOR,
                width:  300,
                height:  300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
