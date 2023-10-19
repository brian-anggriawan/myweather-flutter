import 'location.dart';
import './network.dart';

const apiKey = '9d8f66b03437e6b6ce3e58111d389a2e';

class Weather {
  Future getDataWeather() async {
    // Get user location
    Location location = Location();
    Map curentLocation = await location.getCurrentLocation();

    // Prepare params get weather
    double latitude = curentLocation['latitude'];
    double longitude = curentLocation['longtitude'];
    String uri =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    // Get API weather
    Network network = Network(uri);
    var response = await network.get();
    if (response == null) {
      return {'temperature': 0, 'condition': 0, 'cityName': 'City Not Found'};
    }

    return {
      'temperature': response['main']['temp'],
      'condition': response['weather'][0]['id'],
      'cityName': response['name']
    };
  }

  Future getDataWeatherByCityName(String cityName) async {
    String uri =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    print(uri);
    Network network = Network(uri);
    var response = await network.get();
    if (response == null) {
      return {'temperature': 0, 'condition': 0, 'cityName': 'City Not Found'};
    }
    return {
      'temperature': response['main']['temp'],
      'condition': response['weather'][0]['id'],
      'cityName': response['name']
    };
  }
}
