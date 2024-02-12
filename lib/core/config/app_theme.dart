import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xff0303E2);
const lightColor = Color(0xffD9D9FB);
const backgroundColor = Color(0xffF0F8FF);
const livRedColor = Color(0xffFD6F6F);

final ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    centerTitle: true,
  ),
  useMaterial3: true,
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.roboto(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: GoogleFonts.nunito(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: GoogleFonts.nunito(
      fontSize: 17.0,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  )
      .copyWith(
        secondary: Colors.blue[300],
      )
      .copyWith(background: backgroundColor),
);
