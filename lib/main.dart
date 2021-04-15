import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profoundgodlibrary/views/Chapter.dart';
import 'package:profoundgodlibrary/views/Novel.dart';
import 'package:profoundgodlibrary/views/splash.dart';
import 'bloc/theme_bloc.dart';
import 'constants/constants.dart';
import 'package:profoundgodlibrary/views/dashboard.dart';
// import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void connect() async {
  const BASE = 'http://127.0.0.1:5000';
  String endpoint = '/user/uche';

  var url = Uri.parse(BASE + endpoint);
  var response = await http.get(url);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
}

void main() {
  // connect();
  Bloc.observer = SimpleBlocObserver();
  runApp(ProfoundGodLibrary());
}

class ProfoundGodLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: MaterialApp(
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
        home: SplashScreen(),
        routes: <String, WidgetBuilder>{
          HOME_SCREEN: (BuildContext context) => Dashboard(),
          NOVEL: (BuildContext context) => NovelView(),
          CHAPTER: (BuildContext context) => ChapterView(),
        },
      ),
    );
  }
}
