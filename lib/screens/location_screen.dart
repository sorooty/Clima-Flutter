import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});

  // ignore: prefer_typing_uninitialized_variables
  final locationWeather;

  @override
  // ignore: library_private_types_in_public_api
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature = 0;
  String weatherIcon = '';
  String cityName = '';
  String weatherMess = '';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = "Error";
        weatherMess = 'No weather Data';
        cityName = 'None';
        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMess = weather.getMessage(temperature);
      // print(temperature); for testing purposes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/Mountains.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                // ignore: deprecated_member_use
                Colors.white.withOpacity(0.8),
                BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                      if (typedName != null) {
                        var weatherData =
                            await weather.getCiyWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              DividerSimple(),
              Container(
                height: 200,
                padding: const EdgeInsets.all(2.0),
                child: const Image(
                    height: 200,
                    width: 200,
                    image: AssetImage('images/ClimApp_Logo.png')),
              ),
              // DividerSimple(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                    textAlign: TextAlign.right,
                    cityName,
                    style: TextStyle(
                        fontFamily: 'Spartan MB',
                        fontSize: 70.0,
                        shadows: const [
                          Shadow(
                            blurRadius: 10.0,
                            color: Color.fromARGB(65, 0, 0, 0),
                            offset: Offset(3.0, 3.0),
                          ),
                        ],
                        color: Colors.amberAccent.shade400)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Container(
                  // decoration: kBoxDecoration2(),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      const Text(
                        '☀️',
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
              DividerSimple(),
              Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, left: 10.0, bottom: 6.0),
                child: Container(
                  decoration: kBoxDecoration(),
                  child: Text(
                    "$weatherMess in $cityName !",
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Made By Sensey. All right reserved.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2,
                        color: Colors.amber,
                        backgroundColor: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
