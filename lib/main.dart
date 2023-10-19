import 'package:flutter/material.dart';
import 'views/loading_screen.dart';

void main() {
  runApp(MyWeather());
}

class MyWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
