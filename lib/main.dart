import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/constants.dart';

void resetPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

void main() {
  // connect();
  // resetPrefs();
  runApp(ProfoundGodLibrary());
}

class ProfoundGodLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PG Library',
      theme: ThemeData(
          fontFamily: 'Fira Sans',
          primaryColor: Color(0xFF151311),
          textTheme: TextTheme(
              overline: TextStyle(
            fontFamily: 'Fira Sans',
            color: Color(0xFF151311),
          ))),
      initialRoute: SPLASH,
      routes: <String, WidgetBuilder>{
        // SPLASH: (BuildContext context) => SplashScreen(),
        // HOME_SCREEN: (BuildContext context) => Dashboard(),
        // NOVEL: (BuildContext context) => NovelView(),
        // CHAPTER: (BuildContext context) => ChapterView(),
      },
    );
  }
}
