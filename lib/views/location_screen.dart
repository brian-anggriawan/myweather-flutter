import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';
import '../utils/contants.dart';
import '../utils/weather.dart';
import './city_screen.dart';

Weather weatherService = Weather();

class LocationScreen extends StatefulWidget {
  const LocationScreen({required this.weatherData});

  final weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreen();
}

class _LocationScreen extends State<LocationScreen> {
  String temperature = '0';
  int condition = 0;
  String cityName = '';
  bool isLoading = false;
  String weatherMessage = '';
  String weatherIcon = '';

  @override
  void initState() {
    super.initState();
    updateState(widget.weatherData);
  }

  void updateState(dynamic weatherData) {
    WeatherUtils weatherUtils = WeatherUtils();
    setState(() {
      temperature = weatherData['temperature'].toStringAsFixed(0);
      condition = weatherData['condition'];
      cityName = weatherData['cityName'];
      weatherMessage = weatherUtils.getWeatherMessage(
          int.parse(weatherData['temperature'].toStringAsFixed(0)));
      weatherIcon = weatherUtils.getWeatherIcon(weatherData['condition']);
    });
  }

  Future updateWeather() async {
    setState(() {
      isLoading = true;
    });
    var weather = await weatherService.getDataWeather();
    updateState(weather);
    setState(() {
      isLoading = false;
    });
  }

  Future updateWeatherByCityName(String cityName) async {
    setState(() {
      isLoading = true;
    });
    var weather = await weatherService.getDataWeatherByCityName(cityName);
    updateState(weather);
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

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      await updateWeather();
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (cityName != null) {
                        await updateWeatherByCityName(cityName);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
