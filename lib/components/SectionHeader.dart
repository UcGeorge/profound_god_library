import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profoundgodlibrary/bloc/theme_bloc.dart';
import 'package:profoundgodlibrary/models/theme.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  SectionHeader({String title}):title = title ?? 'Section Header';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 21.5),
      child: BlocBuilder<ThemeBloc, Map<ThemedComponent, dynamic>>(
          builder: (_, theme) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                    color: theme[ThemedComponent.section_head_text],
                  ),
                ),
                SizedBox(
                  height: 12.5,
                ),
                SizedBox(
                  height: 0.5,
                  child: Container(color: theme[ThemedComponent.section_head_line],),
                )
              ],
            );
          }
      ),
    );
  }
}
