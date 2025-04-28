import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import "../services/location.dart";
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '7eadd76060e22de90ed00e18b0b57351';
double latitude = 0;
double longitude = 0;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location Loc = Location();

    await Loc.getCurrentLocation();

    // We verify that we have the right latitude and longitude (those of the current user) :
    latitude = Loc.latitude;
    longitude = Loc.longitude;
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

    NetworkHelper networkHeper = NetworkHelper(url: theUriversion);

    var weatherData = await networkHeper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100,
      )),
    );
  }

// Defining a 'location settings' variable to make the usage easier and code lighter.
  // final LocationSettings locationSettings = LocationSettings(
  //   accuracy: LocationAccuracy.bestForNavigation,
  //   distanceFilter: 100,
  // );

// To discover the "throw" command :
  // smthThatExpectsLessThan10(12);
  // void smthThatExpectsLessThan10(int n) {
  //   if (n > 10) {
  //     throw 'n is greater than 10, n should always be less than 10';
  //   }
  // }

// Tests and tries for the 'Error-handling' lesson :
  // @override
  // Widget build(BuildContext context) {
  //   String myMargin = "abc";
  //   double myMarginAsDouble = 0;

  //   try {
  //     myMarginAsDouble = double.parse(myMargin);
  //   } catch (e) {
  //     print("Should be a number not a string !");
  //   }

  //   return Scaffold(
  //       body: Container(
  //     margin: EdgeInsets.all(30.0),
  //     // margin: EdgeInsets.all(myMarginAsDouble ?? 30) <=> "If the value of the variable is null => we assign a default value (30 in this case)".
  //     color: Colors.red,
  //   ));
  // }
}
