import 'package:http/http.dart' as http;
import 'dart:convert'; // => Package for JSON Conversion operations

class NetworkHelper {
  NetworkHelper({required this.url});

  final Uri
      url; // => Since url-direct access is deprecated, we'll pass an Uri type Url instead of a simple string
  // see -> https://pub.dev/packages/http/example

  Future getData() async {
    var response = await http.get(url);

    // Corresponding URL to the JSON (complete) => https://api.openweathermap.org/data/2.5/weather?lat=29&lon=129&appid=bd4b2c4ca865d5391d69ec90c73b5b82#
    // print(response.statusCode); -> For testing purposes (observe the different status code we could have for each scenarios).
    // See the different 'Status Codes' = https://www.restapitutorial.com/httpstatuscodes
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}



      //   // var decodedData = convert.jsonDecode(data); for complexity matters, we might store this process inside a variable and then use it with more flexibility.

      //   // 1 Temperature
      //   var Temp = convert.jsonDecode(data)["main"]['temp'];
      //   print(Temp);

      //   // 2 Condition number
      //   var Condition = convert.jsonDecode(data)["weather"][0]["id"];
      //   print(Condition);

      //   // 3 City name
      //   var CityName = convert.jsonDecode(data)["name"];
      //   print(CityName);

      //   // var longitude = convert.jsonDecode(data)['coord']['lon'];
      //   // print(longitude);

      //   // var weatherDesc = convert.jsonDecode(data)['weather'][0]["icon"];
      //   // print(weatherDesc);