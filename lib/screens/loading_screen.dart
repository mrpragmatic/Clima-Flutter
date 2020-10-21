import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/location.dart';
import 'location_screen.dart';

const apiKey = 'a199167533b11e9f6141d0412b47f5a8';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

double _latitude;
double _longitude;

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    print('In location');
    try {
      Location location = Location();
      await location.getLocation();
      _latitude = location.latitude;
      _longitude = location.longitude;
      print(_latitude);
      print(_longitude);

      final NetworkHelper networkHelper = NetworkHelper(
          url:
              'https://api.openweathermap.org/data/2.5/weather?lat=$_latitude&lon=$_longitude&appid=$apiKey&units=metric');
        var decodeData = await networkHelper.getData();
        var weatherDesc = decodeData['weather'][0]['description'];
        var temperature = decodeData['main']['temp'];
        var condition = decodeData['weather'][0]['id'];
        var cityName = decodeData['name'];
        print('Weather Desc is $weatherDesc');
        print('temperature is $temperature');
        print('City is $cityName');
        print('Condition is $condition');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LocationScreen(weatherData: decodeData,)));
    } catch (e) {
      print(e);
    }

    // try {

    // } catch (e) {
    //   print('Location error $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
