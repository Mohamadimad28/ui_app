import 'package:flutter/material.dart';
import 'package:ui_app/screens/launch_screen.dart';
import 'package:ui_app/screens/out_boarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_Screen',
      routes: {
        '/launch_Screen': (context) => LaunchScreen(),
        '/out_boarding_screen': (context) => Out(),
      },
    );
  }
}
