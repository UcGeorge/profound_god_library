import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChapterBar extends StatelessWidget {
  const ChapterBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  double.infinity,
      height: 49,
      color: Color(0xFF80706A),
      child: Center(
        child: Container(
          width: 1096,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF80706A),
                  Color(0xFF151311),
                  Color(0xFF80706A),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0, 0.5, 1],
              )
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: 31.49,
                  color: Color(0xFFEAEAEA),
                ),
                SizedBox(width: 124,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Against the Gods',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFEAEAEA),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      'Chapter 1107 - Wu Guike',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFEAEAEA),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 124,),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  size: 31.49,
                  color: Color(0xFFEAEAEA),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}