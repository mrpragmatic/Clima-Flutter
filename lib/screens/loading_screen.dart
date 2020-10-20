import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

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
  getData();
}

void getData() async {
  try {
    var response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longitude&appid=$apiKey');
    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
      var decodeData = jsonDecode(data);
      var weatherDesc = jsonDecode(data)['weather'][0]['description'];
      var temperature = decodeData['main']['temp'];
      var condition = decodeData['weather'][0]['id'];
      var cityName = decodeData['name'];
      print('Weather Desc is $weatherDesc');
      print('temperature is $temperature');
      print('City is $cityName');
      print('Condition is $condition');
    } else {
      print(response.body);
    }
  } catch (e) {
    print("parsing exception $e");
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
