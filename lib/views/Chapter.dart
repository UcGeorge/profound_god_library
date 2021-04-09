import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/components/BackButton.dart';
import 'package:profoundgodlibrary/components/ChapterBar.dart';
import 'package:profoundgodlibrary/components/DarkLightModeButton.dart';
import 'package:profoundgodlibrary/constants/chapterText.dart';
import 'package:google_fonts/google_fonts.dart';

class ChapterView extends StatefulWidget {
  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: dlmButton(),
      body: Stack(
        children: [
          buildBackground(size),
          Center(
            child: SingleChildScrollView(
              child: buildChapterContent(),
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

  Container buildChapterContent() {
    return Container(
      width: 1096 ,
      margin: EdgeInsets.only(top: 49),
      padding: EdgeInsets.all(40),
      color: Color(0xFFFFFFFF),
      child: Text(
        CHAPTER_TEXT,
        style: GoogleFonts.quicksand(
          fontSize: 20,
          letterSpacing: .5,
          color: Color(0xFF80706A),
        ),
      ),
    );
  }

  Container buildBackground(Size size) {
    return Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/light-bg.jpg'),
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
