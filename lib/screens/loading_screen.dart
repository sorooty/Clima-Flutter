import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import "../services/location.dart";
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert; // => Package for JSON Conversion operations

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  // final LocationSettings locationSettings = LocationSettings(
  //   accuracy: LocationAccuracy.bestForNavigation,
  //   distanceFilter: 100,
  // );

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location Loc = Location();
    await Loc.getCurrentLocation();
    print(Loc.latitude);
    print(Loc.longitude);

    // try {
    //   Position position = await Geolocator.getCurrentPosition(
    //       locationSettings: locationSettings);
    //   print(position);
    // } catch (e) {
    //   print(e);
    // }
  }

  void getData() async {
    var url = Uri.https(
      // => Uri is used to structure the given URL
      'api.openweathermap.org',
      '/data/2.5/weather',
      {
        'lat': '29',
        'lon': '129',
        'appid': 'bd4b2c4ca865d5391d69ec90c73b5b82',
      },
    ); // Corresponding URL to the JSON (complete) => https://api.openweathermap.org/data/2.5/weather?lat=29&lon=129&appid=bd4b2c4ca865d5391d69ec90c73b5b82#

    var response = await http.get(url);

    // print(response.statusCode); -> For testing purposes (observe the different status code we could have for each scenarios).
    // See the different 'Status Codes' = https://www.restapitutorial.com/httpstatuscodes

    if (response.statusCode == 200) {
      String data = response.body;

      // var decodedData = convert.jsonDecode(data); for complexity matters, we might store this process inside a variable and then use it with more flexibility.

      // 1 Temperature
      var Temp = convert.jsonDecode(data)["main"]['temp'];
      print(Temp);

      // 2 Condition number
      var Condition = convert.jsonDecode(data)["weather"][0]["id"];
      print(Condition);

      // 3 City name
      var CityName = convert.jsonDecode(data)["name"];
      print(CityName);

      // var longitude = convert.jsonDecode(data)['coord']['lon'];
      // print(longitude);

      // var weatherDesc = convert.jsonDecode(data)['weather'][0]["icon"];
      // print(weatherDesc);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

// To discover the "throw" command :
  // smthThatExpectsLessThan10(12);
  // void smthThatExpectsLessThan10(int n) {
  //   if (n > 10) {
  //     throw 'n is greater than 10, n should always be less than 10';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }

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
