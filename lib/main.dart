import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/Models/LocalStorage.dart';
import 'package:profoundgodlibrary/Views/splash_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:window_utils/window_utils.dart';

import 'Constants/Routes.dart';

void resetPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LocalStorage(),
      child: ProfoundGodLibrary(),
    ),
  );
  doWhenWindowReady(() {
    var initialSize = Size(700, 516);
    appWindow.minSize = initialSize;
    appWindow.title = 'PGL';
  });
}

class ProfoundGodLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PGL',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        backgroundColor: const Color(0xFF121212),
        primaryColor: Color(0xFF121212),
        // ignore: deprecated_member_use
        accentColor: const Color(0xFFF6A00C),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        fontFamily: 'Montserrat',
        inputDecorationTheme: InputDecorationTheme(
            focusColor: const Color(0xFFF6A00C),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                // ignore: deprecated_member_use
                color: const Color(0xFFF6A00C),
              ),
            ),
            hintStyle: TextStyle(
              color: Color(0xFF818991),
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            )),
        textTheme: TextTheme(
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyText1: TextStyle(
            color: Colors.grey[300],
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyText2: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1.0,
          ),
        ),
      ),
      initialRoute: SPLASH,
      routes: <String, WidgetBuilder>{
        SPLASH: (BuildContext context) => SplashView(),
        // HOME_SCREEN: (BuildContext context) => Dashboard(),
        // NOVEL: (BuildContext context) => NovelView(),
        // CHAPTER: (BuildContext context) => ChapterView(),
      },
    );
  }
}
