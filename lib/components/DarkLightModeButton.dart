import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget dlmButton(){
  return GestureDetector(
    onTap: (){},
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: Color(0xFF151311),
        shape: BoxShape.circle,

      ),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.solidMoon,
          color: Color(0xFFEAEAEA),
          size: 20,
        ),
      ),
    ),
  );
}