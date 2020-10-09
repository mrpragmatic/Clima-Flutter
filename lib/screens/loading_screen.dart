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
  print(response.statusCode);
  print(response.body);
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
