import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profoundgodlibrary/bloc/theme_bloc.dart';
import 'package:profoundgodlibrary/components/BackButton.dart';
import 'package:profoundgodlibrary/components/ChapterBar.dart';
import 'package:profoundgodlibrary/components/DarkLightModeButton.dart';
import 'package:profoundgodlibrary/constants/chapterText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/models/theme.dart';

class ChapterView extends StatefulWidget {
  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<ThemeBloc, Map<ThemedComponent, dynamic>>(
        builder: (_, theme){
          return Scaffold(
              backgroundColor: theme[ThemedComponent.scaffold_bg],
              floatingActionButton: DlmButton(),
              body: Stack(
                children: [
                  buildBackground(size, theme),
                  Center(
                    child: SingleChildScrollView(
                      child: buildChapterContent(theme),
                    ),
                  ),
                  Column(
                    children: [
                      ChapterBar(),
                      buildBackButton(),
                    ],
                  ),
                ],
              )
          );
        }
    );
  }

  Container buildChapterContent(Map<ThemedComponent, dynamic> theme) {
    return Container(
      width: 1096 ,
      margin: EdgeInsets.only(top: 49),
      padding: EdgeInsets.all(40),
      color: theme[ThemedComponent.chapter_text_bg],
      child: Text(
        CHAPTER_TEXT,
        style: GoogleFonts.quicksand(
          fontSize: 20,
          letterSpacing: .5,
          color: theme[ThemedComponent.chapter_text],
        ),
      ),
    );
  }

  Container buildBackground(Size size, Map<ThemedComponent, dynamic> theme) {
    return Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(theme[ThemedComponent.background_image]),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              )
          ),
        );
  }

  Widget buildBackButton() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.topLeft,
        child: CustomBackButton(),
      ),
    );
  }
}
