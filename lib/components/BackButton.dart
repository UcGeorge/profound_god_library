import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Color(0xFF80706A),
              width: 1.5,
            )
        ),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Color(0xFF80706A),
            size: 15.5,
          ),
        ),
      ),
    );
  }
}