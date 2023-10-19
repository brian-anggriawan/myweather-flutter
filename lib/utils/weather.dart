class WeatherUtils {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    }
    if (condition < 400) {
      return '🌧';
    }
    if (condition < 600) {
      return '☔️';
    }
    if (condition < 700) {
      return '☃️';
    }
    if (condition < 800) {
      return '🌫';
    }
    if (condition == 800) {
      return '☀️';
    }
    if (condition <= 804) {
      return '☁️';
    }
    return '🤷‍';
  }

  String getWeatherMessage(int temp) {
    if (temp < 10) {
      return 'You will need 🧣 and 🧤';
    }
    if (temp >= 10 && temp <= 19) {
      return 'Bring a 🧥 just in case';
    }
    if (temp >= 20 && temp <= 24) {
      return 'Time for shorts and 👕';
    }
    return 'Its time for eat 🍦';
  }
}
