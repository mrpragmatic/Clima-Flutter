import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import '../services/location.dart';

const apiKey = 'a199167533b11e9f6141d0412b47f5a8';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

double _latitude;
double _longitude;
void getLocation() async {
  Location location = Location();
  await location.getLocation();
  _latitude = location.latitude;
  _longitude = location.longitude;
  print(location.latitude);
  print(location.longitude);
  try {
    final NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longitude&appid=$apiKey');
    var decodeData = await networkHelper.getData();
    var weatherDesc = decodeData['weather'][0]['description'];
    var temperature = decodeData['main']['temp'];
    var condition = decodeData['weather'][0]['id'];
    var cityName = decodeData['name'];
    print('Weather Desc is $weatherDesc');
    print('temperature is $temperature');
    print('City is $cityName');
    print('Condition is $condition');
  } catch (e) {
    print('Location error $e');
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
