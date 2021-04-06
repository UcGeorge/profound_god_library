import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({String title}):title = title ?? 'Section Header';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 21.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w100,
              color: Color(0xFF151311).withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: 12.5,
          ),
          SizedBox(
            height: 0.5,
            child: Container(color: Color(0xFF707070),),
          )
        ],
      ),
    );
  }
}
