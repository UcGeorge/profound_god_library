import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/bloc/theme_bloc.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
import 'package:profoundgodlibrary/models/theme.dart';
import 'ContinueReadingButton.dart';

class NovelCardDiscover extends StatelessWidget {
  final String title;
  final int chapterNum;
  final ImageProvider coverImage;


  NovelCardDiscover({ImageProvider coverImage, String title, int chapterNum})
      :title = title,
      chapterNum = chapterNum,
      coverImage = coverImage ?? AssetImage('assets/images/placeholder-image.png');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 274,
      height: 363,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: coverImage,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.all(20),
          height: 134,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                //Color(0xFF151311).withOpacity(0.1),
                //Color(0xFF151311).withOpacity(0.3),
                //Color(0xFF151311).withOpacity(0.9),
                Color(0xFF151311),
              ],
              stops: [0, 0.9]
            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFEAEAEA),
                ),
              ),
              SizedBox(height: 8,),
              Text(
                chapterNum.toString() + ' chapters',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFEAEAEA),
                  letterSpacing: 1.5
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NovelCard extends StatelessWidget {
  final String title;
  final int chapterNum;
  final ImageProvider coverImage;


  NovelCard({ImageProvider coverImage, String title, int chapterNum})
      :title = title,
        chapterNum = chapterNum,
        coverImage = coverImage ?? AssetImage('assets/images/placeholder-image.png');

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, NOVEL);
          },
          child: Container(
            width: 274,
            height: 363,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: coverImage,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20),
                height: 134,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        //Color(0xFF151311).withOpacity(0.1),
                        //Color(0xFF151311).withOpacity(0.3),
                        //Color(0xFF151311).withOpacity(0.9),
                        Color(0xFF151311),
                      ],
                      stops: [0, 0.9]
                  ),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFEAEAEA),
                      ),
                    ),
                    SizedBox(height: 18,),
                    Text(
                      chapterNum.toString() + ' chapters',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFEAEAEA),
                          letterSpacing: 1.5
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: CRB(),
        ),
      ],
    );
  }
}

class DiscoverCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, Map<ThemedComponent, dynamic>>(
        builder: (_, theme) {
          return Container(
            width: 274,
            height: 363,
            decoration: BoxDecoration(
              color: theme[ThemedComponent.discover_card_bg],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: theme[ThemedComponent.discover_card_icon],
                size: 92,
              ),
            ),
          );
        }
    );
  }
}