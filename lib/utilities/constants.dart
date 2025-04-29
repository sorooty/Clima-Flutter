import 'package:flutter/material.dart';

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
    return Divider(
      color: const Color.fromARGB(122, 255, 255, 255),
      thickness: 3,
      indent: 30,
      endIndent: 30,
    );
  }
}
