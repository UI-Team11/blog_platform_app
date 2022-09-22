import 'package:flutter/material.dart';

// Primary Color Theme

const int primaryColor = 0xFF062452;
const int primaryColorLight = 0xFF003A66;
const int primaryColorDark = 0xFF00153b;
const int backgroundColor = 0xFFB7D6E6;

const MaterialColor blueNavy = MaterialColor(
  primaryColorDark,
  <int, Color>{
    50: Color(0xFFE2EFF4),
    100: Color(0xFFB7D6E6), // Background Color
    200: Color(0xFF8DBDD6),
    300: Color(0xFF4B92BB),
    400: Color(0xFF2675A6),
    500: Color(0xFF0F5585),
    600: Color(0xFF003A66), // Primary Color Light
    700: Color(0xFF0E2C5E),
    800: Color(0xFF062452), // Primary Color
    900: Color(0xFF00153b), // Primary Color Dark
  },
);

// Secondary Color Theme

const int secondaryColor = 0xFF394D5C;
const int secondaryColorLight = 0xFF476072;
const int secondaryColorDark = 0xFF273844;

const MaterialColor blueGrey = MaterialColor(
  secondaryColorDark,
  <int, Color>{
    50: Color(0xFFE8F1FA),
    100: Color(0xFFCCDBE6),
    200: Color(0xFFAFC2D1),
    300: Color(0xFF92A9BC),
    400: Color(0xFF7B96AB),
    500: Color(0xFF64839B),
    600: Color(0xFF577489),
    700: Color(0xFF476072), // Secondary Color Light
    800: Color(0xFF394D5C), // Secondary Color
    900: Color(0xFF273844), // Secondary Color Dark
  },
);

// Alternative Color Theme

const int alternativeColor = 0xFF4B92BB;
const int alternativeColorLight = 0xFF6eBAD8;
const int alternativeColorDark = 0xFF305171;

const MaterialColor blueLight = MaterialColor(
  alternativeColor,
  <int, Color>{
    50: Color(0xFFE3F3F8),
    100: Color(0xFFB8E1EF),
    200: Color(0xFF8ECEE4),
    300: Color(0xFF6eBAD8), // Alternative Color Light
    400: Color(0xFF5DADD0),
    500: Color(0xFF529FC9),
    600: Color(0xFF4B92BB), // Primary Color
    700: Color(0xFF4280A8),
    800: Color(0xFF3D6F94),
    900: Color(0xFF305171), // Primary Color Dark
  },
);