// Importing necessary packages and modules
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import 'WAppColors.dart';

// Class to define the theme data for the application
class AppThemeData {
  // Private constructor to prevent instantiation
  AppThemeData._();

  // Light theme data
  static final ThemeData lightTheme = ThemeData(
    // Setting the background color of the scaffold
    scaffoldBackgroundColor: whiteColor,
    // Setting the primary color of the theme
    primaryColor: Colors.blue,
    // Setting the dark variant of the primary color
    primaryColorDark: Colors.white,
    // Setting the color to use for error indicators
    errorColor: Colors.red,
    // Setting the color to use for hover highlights
    hoverColor: Colors.white54,
    // Setting the color to use for hint text or placeholder text
    hintColor: Colors.blue,
    // Setting the color to use for dividers
    dividerColor: viewLineColor,
    // Setting the color to use for cards
    cardColor: Colors.black,
    // Setting the font family to use in the theme
    fontFamily: GoogleFonts.nunito().fontFamily,
    // Setting the theme to use for app bars
    appBarTheme: const AppBarTheme(
      // Setting the background color of the app bar
      color: appLayout_background,
      // Setting the theme to use for icon colors
      iconTheme: IconThemeData(color: textPrimaryColor),
    ),
    // Setting the color scheme to use for the theme
    colorScheme: const ColorScheme.light(
      /*primary: appColorPrimary,
      primaryVariant: appColorPrimary,*/
    ),
    // Setting the theme to use for cards
    cardTheme: const CardTheme(color: Colors.white),
    // Setting the theme to use for icon colors
    iconTheme: const IconThemeData(color: textPrimaryColor),
    // Setting the theme to use for bottom sheets
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: whiteColor),
    // Setting the text theme to use for the theme
    textTheme: const TextTheme(
/*
      button: TextStyle(color: appColorPrimary),
*/
      // Setting the text style to use for headlines
      headline6: TextStyle(color: textPrimaryColor),
      // Setting the text style to use for subtitles
      subtitle2: TextStyle(color: textSecondaryColor),
    ),
    // Setting the visual density to use for the theme
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    // Setting the page transitions theme to use for the theme
      pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: ZoomPageTransitionsBuilder(),
        TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
      }));

  // Dark theme data
  static final ThemeData darkTheme = ThemeData(
    // Setting the background color of the scaffold
    scaffoldBackgroundColor: appBackgroundColorDark,
    // Setting the color to use for highlights
    highlightColor: appBackgroundColorDark,
    // Setting the color to use for error indicators
    errorColor: const Color(0xFFCF6676),
    // Setting the theme to use for app bars
    appBarTheme: const AppBarTheme(color: appBackgroundColorDark, iconTheme: IconThemeData(color: whiteColor)),
    // Setting the primary color of the theme
    primaryColor: color_primary_black,
    // Setting the color to use for hint text or placeholder text
    hintColor: whiteColor,
    // Setting the color to use for dividers
    dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
    // Setting the dark variant of the primary color
    primaryColorDark: color_primary_black,
    // Setting the color to use for cards
    cardColor: Colors.white,
    // Setting the color to use for hover highlights
    hoverColor: Colors.black12,
    // Setting the font family to use in the theme
    fontFamily: GoogleFonts.nunito().fontFamily,
    // Setting the theme to use for bottom sheets
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
    // Setting the primary text theme to use for the theme
    primaryTextTheme: TextTheme(
      // Setting the text style to use for headlines
      headline6: primaryTextStyle(color: Colors.white),
      // Setting the text style to use for overlines
      overline: primaryTextStyle(color: Colors.white),
    ),
    // Setting the color scheme to use for the theme
    colorScheme: const ColorScheme.dark(
      // Setting the primary color of the color scheme
      primary: appBackgroundColorDark,
      // Setting the color to use on primary color surfaces
      onPrimary: cardBackgroundBlackDark,
    ),
    // Setting the theme to use for cards
    cardTheme: const CardTheme(color: cardBackgroundBlackDark),
    // Setting the theme to use for icon colors
    iconTheme: const IconThemeData(color: whiteColor),
    // Setting the text theme to use for the theme
    textTheme: const TextTheme(
      // Setting the text style to use for buttons
      button: TextStyle(color: color_primary_black),
      // Setting the text style to use for headlines
      headline6: TextStyle(color: whiteColor),
      // Setting the text style to use for subtitles
      subtitle2: TextStyle(color: Colors.white54),
    ),
    // Setting the visual density to use for the theme
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ).copyWith(
    // Setting the page transitions theme to use for the theme
      pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: ZoomPageTransitionsBuilder(),
        TargetPlatform.macOS: ZoomPageTransitionsBuilder(),
      }));
}