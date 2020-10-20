import 'dart:convert';

import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

void getLocation() async {
  Location location = Location();
  await location.getLocation();
  print(location.latitude);
  print(location.longitude);
}

void getData() async {
  var response = await http.get(
      'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6097d289e10d714a6e88b30761fae22');
  if (response.statusCode == 200) {
    try {
      var data = response.body;
      print(data);
      var jsonData = jsonDecode(data);
      var weatherDesc = jsonDecode(data)['weather'][0]['description'];
      var temperature = jsonData['main']['temp'];
      var condition = jsonData['weather'][0]['id'];
      var cityName = jsonData['name'];
      print('Weather Desc is $weatherDesc');
      print('temperature is $temperature');
      print('City is $cityName');
      print('Condition is $condition');
    } catch (e) {
      print("parsing exception $e");
    }
  } else {
    print(response);
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
    getData();
    return Scaffold();
  }
}
