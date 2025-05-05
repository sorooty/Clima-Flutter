import "../services/location.dart";
import '../services/networking.dart';

const apiKey = '7eadd76060e22de90ed00e18b0b57351';
// double latitude = 0;
// double longitude = 0;

class WeatherModel {
  Future<dynamic> getCiyWeather(String cityName) async {
    var getCityUrl = Uri.https(
      // => Uri is used to structure the given URL
      'api.openweathermap.org',
      '/data/2.5/weather',
      {'q': cityName, 'appid': apiKey, 'units': 'metric'},
    );

    NetworkHelper networkHelper = NetworkHelper(url: getCityUrl);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location Loc = Location();

    await Loc.getCurrentLocation();

    // Je stocke l'url au format UrI dans cette variable :
    Uri theUriversion = Uri.https(
      // => Uri is used to structure the given URL
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': '${Loc.latitude}',
        'lon': '${Loc.longitude}',
        'appid': apiKey,
        'units': 'metric', // Pour avoir la température en degré °C
      },
    );

    // j'utilise la variable qui contient l'url au format uri pour eviter la surcharge de code :
    NetworkHelper networkHeper = NetworkHelper(url: theUriversion);

    var weatherData = await networkHeper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
