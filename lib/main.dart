import 'package:flutter/material.dart';
import 'package:tfnd/splash/splash.dart';

import 'business/Busines_home.dart';
import 'business/navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xfff760b1)),
        useMaterial3: true,
      ),
      home: //const BussinessNavBar(),
          SplashScreen(),
    );
  }
}
