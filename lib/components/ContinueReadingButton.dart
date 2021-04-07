import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CRB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      onTap: (){},
      child: Container(
        width: 111,
        height: 25,
        decoration: BoxDecoration(
          color: Color(0xFF151311),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          border: Border.all(
            color: Color(0xFFEAEAEA),
            width: 1,
          )
        ),
        child: Center(
          child: Text(
            'continue reading',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w300,
              color: Color(0xFFEAEAEA),
              letterSpacing: 1
            ),
          ),
        ),
      ),
    );
  }
}
