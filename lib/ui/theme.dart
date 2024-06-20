import 'package:flutter/material.dart';

const Color bluishColor = Color(0xFF3832F9);
const Color yellowColor = Color.fromARGB(255, 156, 188, 12);
const Color pinkColor = Color(0xFFC8000A);
const Color greyColor = Color(0xFF9E9E9E);
const Color darkGreyColor = Color(0xFF151515);
const Color whiteColor = Color(0xFFFFFFFF);
const Color blackColor = Color(0xFF000000);
const primaryColor = bluishColor;

class Themes{
  static final light =  ThemeData(
  primaryColor: primaryColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  );

  static final dark =  ThemeData(
  primaryColor: darkGreyColor,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  );
}