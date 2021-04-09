import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/bloc/theme_bloc.dart';
import 'package:profoundgodlibrary/models/theme.dart';

class DlmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        onTap: (){
          context.read<ThemeBloc>().add(ThemeEvent.change_theme);
        },
        child: BlocBuilder<ThemeBloc, Map<ThemedComponent, dynamic>>(
            builder: (_, theme){
              return Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: theme[ThemedComponent.theme_button_bg],
                  shape: BoxShape.circle,

                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.solidLightbulb,
                    //FontAwesomeIcons.lightbulb, - Dark mode
                    color: theme[ThemedComponent.theme_button_icon],
                    size: 20,
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}