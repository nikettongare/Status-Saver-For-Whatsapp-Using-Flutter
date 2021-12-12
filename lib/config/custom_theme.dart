import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomThemes {
  Color black1 = const Color(0xff000000);
  Color black2 = const Color(0xff222222);
  Color black3 = const Color(0xff444444);
  Color black4 = const Color(0xff666666);
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xffdee0de),
    primaryColor: const Color(0xff42889e),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff42889e),
    ),
    colorScheme: const ColorScheme.light(),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Colors.white,
      ),
      backgroundColor: const Color(0xff316879),
    ),
    primaryTextTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline1: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      headline2: GoogleFonts.poppins(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
      bodyText1: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: GoogleFonts.poppins(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
    ),
    tabBarTheme: TabBarTheme(
      indicator: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        color: Color(0xff42889e),
      ),
      unselectedLabelColor: const Color(0xffcccccc),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: const Color(0xffffffff),
      labelStyle: GoogleFonts.poppins(),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff000000),
    primaryColor: const Color(0xff444444),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff222222),
    ),
    colorScheme: const ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 22,
        color: Colors.white,
      ),
      backgroundColor: const Color(0xff222222),
    ),
    primaryTextTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headline1: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      headline2: GoogleFonts.poppins(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
      bodyText1: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: GoogleFonts.poppins(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
    ),
    tabBarTheme: TabBarTheme(
      indicator: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        color: Color(0xff444444),
      ),
      unselectedLabelColor: const Color(0xff666666),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: const Color(0xffffffff),
      labelStyle: GoogleFonts.poppins(),
    ),
  );
}
