import 'package:flutter/material.dart';

ThemeData lightmood = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(),
  scaffoldBackgroundColor: Colors.white,
);

ThemeData darkmood = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(),
  scaffoldBackgroundColor: Colors.grey[800],
  cardColor: Colors.grey[700],
);
