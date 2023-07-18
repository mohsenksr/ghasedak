import 'package:flutter/material.dart';
import 'package:ghasedak/core/styles/colors.dart';
import 'package:ghasedak/core/styles/font_size.dart';
import 'package:ghasedak/core/styles/spacings.dart';

final mainDayTheme = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: mainBackgroundColor,
      error: errorColor,
      onBackground: mainBackgroundColor,
      primary: primaryColor,
      onError: errorColor,
      onPrimary: primaryColor,
      secondary: dimBlackColor,
      onSecondary: dimBlackColor,
      surface: dimBlackColor,
      onSurface: dimBlackColor,
    ),
    cardColor: Colors.white,
    cardTheme: CardTheme(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacings.radiusXXl)),
    ),
    fontFamily: 'Vazirmatn',
    primaryColor: primaryColor,
    primaryColorLight: kLightTextColor,
    primaryColorDark: darkPrimaryColor,
    disabledColor: greyColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      // enabledBorder: const OutlineInputBorder(
      //   borderSide: const BorderSide(color: primaryColor, width: 1.0),
      // ),
      focusedBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor, width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(Spacings.radiusLg))
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: greyColor[900]!, width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(Spacings.radiusLg))
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      shape: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Spacings.radiusLg));
      }),
      foregroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) => Colors.white),
      backgroundColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled))
          return primaryColor.shade100;
        else
          return primaryColor;
      }),
    )),
    unselectedWidgetColor: greyColor,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Spacings.radiusLg),
        ),
        padding: const EdgeInsets.all(0),
        side: BorderSide(width: 1, color: primaryColor),
      ),
    ),
    scaffoldBackgroundColor: kLightTextColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        showSelectedLabels: true,
        type: BottomNavigationBarType.shifting,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
        selectedIconTheme: IconThemeData(color: primaryColor),
        unselectedItemColor: kLightGreyColor,
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: kLightGreyColor),
        unselectedIconTheme: IconThemeData(
          color: kLightGreyColor,
        ),
        showUnselectedLabels: false),
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: kIconBackgroundColor, width: 2.0),
            borderRadius: BorderRadius.circular(Spacings.radiusLg)),
        buttonColor: primaryColor),
    textTheme: const TextTheme(
      caption: TextStyle(color: kBodyTextColor, fontSize: k12TextFontSize),
      bodyText1: TextStyle(
        color: kBodyTextColor,
        fontSize: k16TextFontSize,
      ),
      bodyText2: TextStyle(
        color: primaryColor,
        fontSize: k14TextFontSize,
      ),
      subtitle1: TextStyle(color: kBodyTextColor, fontSize: k14TextFontSize),
      subtitle2: TextStyle(color: kLightTextColor, fontSize: k14TextFontSize),
      headline1: TextStyle(
        fontSize: k18TextFontSize,
        fontWeight: FontWeight.w700,
        color: kLightTextColor,
      ),
      headline2: TextStyle(
        color: kDeepGreyColor,
        fontWeight: FontWeight.w700,
        fontSize: k18TextFontSize,
      ),
      headline3: TextStyle(
        color: kDeepGreyColor,
        fontWeight: FontWeight.w700,
        fontSize: k14TextFontSize,
      ),
      headline4: TextStyle(
        color: kLightTextColor,
        fontWeight: FontWeight.w700,
        fontSize: k14TextFontSize,
      ),
      headline5: TextStyle(
        color: kBodyTextColor,
        fontWeight: FontWeight.w700,
        fontSize: k14TextFontSize,
      ),
      headline6: TextStyle(
        color: kBodyTextColor,
        fontWeight: FontWeight.w700,
        fontSize: k12TextFontSize,
      ),
    ));