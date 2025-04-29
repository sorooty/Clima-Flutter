import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);

  String result = 'null';

  await Future.delayed(threeSeconds, () {
    // => Allow other methods to be ran before this task (delay)
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
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