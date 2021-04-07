import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/views/Novel.dart';
import 'package:profoundgodlibrary/views/dashboard.dart';

import 'constants/constants.dart';

void main(){
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
          )
        )
      ),
      home: NovelView(),
      routes: <String, WidgetBuilder>{
        HOME_SCREEN: (BuildContext context) => NovelView(),
        //NOVEL: (BuildContext context) => Dashboard(),
      },
    );
  }
}
