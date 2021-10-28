import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
import 'package:profoundgodlibrary/src/LocalStorage.dart';
import 'package:profoundgodlibrary/Views/splash_view.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:profoundgodlibrary/src/Network.dart';

void resetPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalStorage()),
        ChangeNotifierProvider(create: (context) => Network()),
        ChangeNotifierProvider(create: (context) => Database(context)),
      ],
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
      darkTheme: kDarkThemeData,
      home: SplashView(),
    );
  }
}
