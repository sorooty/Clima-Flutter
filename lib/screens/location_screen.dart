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
              const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
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

/// ----------------------------------------DOCS----------------------------------------------////
/// The `LocationScreen` class is a stateful widget that displays weather information
/// for a specific location. It uses the `WeatherModel` class to fetch and display
/// weather data.
///
/// This screen includes the following features:
/// - Displays the current temperature, weather condition, and city name.
/// - Allows the user to fetch weather data for their current location.
/// - Allows the user to search for weather data by entering a city name.
///
/// Constructor:
/// - `LocationScreen({required this.locationWeather})`: Accepts `locationWeather`
///   as a parameter, which contains the initial weather data.
///
/// Properties:
/// - `locationWeather`: A dynamic object containing the initial weather data.
///
/// State:
/// - `_LocationScreenState`: Manages the state of the `LocationScreen`.
///
/// Methods:
/// - `initState()`: Initializes the state and updates the UI with the initial weather data.
/// - `updateUI(dynamic weatherData)`: Updates the UI with the provided weather data.
///   If the data is null, it displays default error messages.
///
/// UI Components:
/// - A background image with a semi-transparent overlay.
/// - A row with two buttons:
///   - "Near Me" button: Fetches weather data for the current location.
///   - "City" button: Navigates to a city search screen and fetches weather data for the selected city.
/// - Displays the app logo.
/// - Displays the city name, temperature, and weather condition.
/// - Displays a message about the weather in the selected city.
/// - Footer with a copyright message.
///
/// Note:
/// - The `updateUI` method handles null weather data gracefully by displaying default values.
/// - The `DividerSimple` widget is used for visual separation but is not defined in this file.
/// - The `kBoxDecoration`, `kBoxDecoration2`, `kTempTextStyle`, `kConditionTextStyle`, and
///   `kMessageTextStyle` constants are used for styling but are not defined in this file.
