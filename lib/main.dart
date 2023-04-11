import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/views/home/screen_home.dart';

import 'core/color/color.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: kbluishCyan),
      home: ScreenHome(),
    );
  }
}
