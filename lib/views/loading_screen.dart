import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';
import './location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreen();
}

class _LoadingScreen extends State<LoadingScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    Weather weatherService = Weather();
    var weather = await weatherService.getDataWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(weatherData: weather);
        },
      ),
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SpinKitWaveSpinner(
        color: Colors.blue,
        size: 100.0,
      );
    }
    return Scaffold();
  }
}
