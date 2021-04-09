import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/bloc/theme_bloc.dart';
import 'package:profoundgodlibrary/models/theme.dart';

class ChapterBar extends StatelessWidget {
  const ChapterBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, Map<ThemedComponent, dynamic>>(
        builder: (_, theme){
          return Container(
            width:  double.infinity,
            height: 49,
            color: theme[ThemedComponent.chapter_bar_gradient_end],
            child: Center(
              child: Container(
                width: 1096,
                height: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        theme[ThemedComponent.chapter_bar_gradient_end],
                        theme[ThemedComponent.chapter_bar_gradient_origin],
                        theme[ThemedComponent.chapter_bar_gradient_end],
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
                        color: theme[ThemedComponent.chapter_bar_textIcon],
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
                                color: theme[ThemedComponent.chapter_bar_textIcon],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 3,),
                          Text(
                            'Chapter 1107 - Wu Guike',
                            style: TextStyle(
                              fontSize: 14,
                              color: theme[ThemedComponent.chapter_bar_textIcon],
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 124,),
                      FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: 31.49,
                        color: theme[ThemedComponent.chapter_bar_textIcon],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
}