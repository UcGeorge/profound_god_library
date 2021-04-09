import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/bloc/theme_bloc.dart';
import 'package:profoundgodlibrary/models/theme.dart';

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
      child: BlocBuilder<ThemeBloc, Map<ThemedComponent, dynamic>>(
          builder: (_, theme) {
            return Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme[ThemedComponent.back_button],
                    width: 1.5,
                  )
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: theme[ThemedComponent.back_button],
                  size: 15.5,
                ),
              ),
            );
          }
      ),
    );
  }
}