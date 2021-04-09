import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget dlmButton(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: InkWell(
      borderRadius: BorderRadius.all(Radius.circular(18)),
      onTap: (){},
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Color(0xFF151311),
          shape: BoxShape.circle,

        ),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.solidLightbulb,
            //FontAwesomeIcons.lightbulb, - Dark mode
            color: Color(0xFFEAEAEA),
            size: 20,
          ),
        ),
      ),
    ),
  );
}