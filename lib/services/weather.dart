import 'package:clima/services/location.dart';

import 'networking.dart';

const apiKey = 'a199167533b11e9f6141d0412b47f5a8';
const openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherUrl?q=$cityName&appid=$apiKey&units=metric';
    var weatherData =  await NetworkHelper(url: url).getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation();

    final NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var decodeData = await networkHelper.getData();
    var weatherDesc = decodeData['weather'][0]['description'];
    var temperature = decodeData['main']['temp'];
    var condition = decodeData['weather'][0]['id'];
    var cityName = decodeData['name'];
    print('Weather Desc is $weatherDesc');
    print('temperature is $temperature');
    print('City is $cityName');
    print('Condition is $condition');
    return decodeData;
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
