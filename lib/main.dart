import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profoundgodlibrary/views/Chapter.dart';
import 'package:profoundgodlibrary/views/Novel.dart';
import 'bloc/theme_bloc.dart';
import 'constants/constants.dart';
import 'package:profoundgodlibrary/views/dashboard.dart';

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

void main(){
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
            )
          )
        ),
        initialRoute: HOME_SCREEN,
        routes: <String, WidgetBuilder>{
          HOME_SCREEN: (BuildContext context) => Dashboard(),
          NOVEL: (BuildContext context) => NovelView(),
          CHAPTER: (BuildContext context) => ChapterView(),
        },
      ),
    );
  }
}
