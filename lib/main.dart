import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/dashboard.dart';

void main(){
  runApp(ProfoundGodLibrary());
}

class ProfoundGodLibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PG Library',
      home: Dashboard(),
    );
  }
}
