import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import "../services/location.dart";

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

// To discover the "throw" command :
  // smthThatExpectsLessThan10(12);
  // void smthThatExpectsLessThan10(int n) {
  //   if (n > 10) {
  //     throw 'n is greater than 10, n should always be less than 10';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
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
