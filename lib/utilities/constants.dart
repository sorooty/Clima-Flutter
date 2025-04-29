import 'package:flutter/material.dart';
/// A collection of constants and utility widgets used throughout the application.
///
/// ## Constants:
/// - `kTempTextStyle`: A `TextStyle` for displaying temperature with a large font size.
/// - `kMessageTextStyle`: A `TextStyle` for displaying messages with a medium font size and alphabetic text baseline.
/// - `kButtonTextStyle`: A `TextStyle` for buttons with a smaller font size, white color, and custom font family.
/// - `kConditionTextStyle`: A `TextStyle` for displaying weather conditions with a large font size.
/// - `kTextfieldInput`: An `InputDecoration` for text fields with a filled white background, rounded borders, and a location icon.
///
/// ## Utility Functions:
/// - `kBoxDecoration()`: Returns a `BoxDecoration` with rounded corners and a blue background color.
/// - `kBoxDecoration2()`: Returns a `BoxDecoration` with rounded corners and a slightly different blue background color.
///
/// ## Widgets:
/// - `DividerSimple`: A custom `StatelessWidget` that provides a styled divider with a white semi-transparent color,
///   thickness of 3, and horizontal padding (indent and endIndent).

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 60.0,
    textBaseline: TextBaseline.alphabetic);

const kButtonTextStyle =
    TextStyle(fontSize: 30.0, fontFamily: 'Spartan MB', color: Colors.white);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextfieldInput = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter a City name...",
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide.none),
);

BoxDecoration kBoxDecoration() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: const Color.fromARGB(255, 3, 130, 194));
}

BoxDecoration kBoxDecoration2() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: const Color.fromARGB(255, 12, 127, 184));
}

class DividerSimple extends StatelessWidget {
  const DividerSimple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromARGB(122, 255, 255, 255),
      thickness: 3,
      indent: 30,
      endIndent: 30,
    );
  }
}
