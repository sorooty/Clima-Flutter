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
      // ignore: avoid_print
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

/// ------------------------------DOCS---------------------------------------////
/// /// A helper class to handle network requests and fetch data from a given URL.
///
/// The `NetworkHelper` class is designed to work with the `http` package to
/// perform GET requests and decode JSON responses.
///
/// Example usage:
/// ```dart
/// var networkHelper = NetworkHelper(url: Uri.parse('https://example.com'));
/// var data = await networkHelper.getData();
/// ```
///
/// Constructor:
/// - `NetworkHelper({required Uri url})`: Accepts a `Uri` object representing
///   the URL to fetch data from.
///
/// Properties:
/// - `url`: A `Uri` object representing the endpoint for the network request.
///
/// Methods:
/// - `Future getData()`: Performs a GET request to the specified `url`. If the
///   request is successful (status code 200), it decodes the JSON response and
///   returns it. Otherwise, it prints an error message with the status code.
///
/// Notes:
/// - Ensure that the provided `url` is a valid `Uri` object.
/// - The method uses `jsonDecode` to parse the response body into a Dart object.
/// - Handle potential exceptions (e.g., network errors) when using this class.
///
/// References:
/// - [HTTP Status Codes](https://www.restapitutorial.com/httpstatuscodes)
/// - [http package example](https://pub.dev/packages/http/example)
