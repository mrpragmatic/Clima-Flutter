import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    print('In location');
    try {
      var decodeData = await WeatherModel().getLocationData();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LocationScreen(
                    weatherData: decodeData,
                  )));
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
