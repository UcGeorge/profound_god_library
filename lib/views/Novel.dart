import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/components/BackButton.dart';
import 'package:profoundgodlibrary/components/ChapterImage.dart';
import 'package:profoundgodlibrary/components/ChapterListItem.dart';
import 'package:profoundgodlibrary/components/DarkLightModeButton.dart';
import 'package:profoundgodlibrary/constants/ChapterAttributes.dart';

class NovelView extends StatefulWidget {
  @override
  _NovelViewState createState() => _NovelViewState();
}

class _NovelViewState extends State<NovelView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: dlmButton(),
      body: Stack(
        children: [
          buildBackground(),
          Center(
            child: Container(
              width: 1096 ,
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 307,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.only(bottom: 59),
                        child: Text(
                          'Against the Gods',
                          style: TextStyle(
                            fontSize: 34,
                            color: Color(0xFF2F2F2F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 717,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: buildContinueReadingButton(),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 29),
                              width: double.infinity,
                              color: Color(0xFFEAEAEA),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 14.5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 80,),
                                          ChapterListItem(
                                            name: 'Chapter 1776 - The Collapse of A Dragon',
                                            attributes: [ChapterAttribute.NEW],
                                          ),
                                          ChapterListItem(
                                            name: 'Chapter 1775 - The Devil Master’s Kill Order',
                                            attributes: [ChapterAttribute.NEW],
                                          ),
                                          ChapterListItem(
                                            name: 'Chapter 1774 - Enraged',
                                            attributes: [ChapterAttribute.NEW],
                                          ),
                                          ChapterListItem(
                                            name: 'Chapter 1773 - Ash Dragon God',
                                          ),
                                          ChapterListItem(
                                            name: 'Chapter 1772 - The Four Emperors of the Southern Divine Region',
                                            attributes: [ChapterAttribute.BOOKMARKED],
                                          ),
                                          ChapterListItem(
                                            name: 'Chapter 1771 - Voyage to the Southern Sea',
                                            attributes: [ChapterAttribute.LIKED],
                                          ),
                                          ChapterListItem(
                                            name: 'Chapter 1770 - Poyun’s Obsession',
                                          ),
                                          ChapterListItem(
                                            name: 'Chapter 1769 - Just Like I Remembered',
                                            attributes: [ChapterAttribute.LIKED],
                                          ),
                                          Container(
                                            height: 0.5,
                                            width: double.infinity,
                                            color: Color(0xFFC4B7BF),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ChapterImage()
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  InkWell buildContinueReadingButton() {
    return InkWell(
      onTap: (){},
      splashColor: Color(0xFFEAEAEA),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        margin: EdgeInsets.only(right: 35, bottom: 10),
        width: 172,
        height: 31,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xFF2F2F2F),
        ),
        child: Center(
          child: Text(
            'continue reading',
            style: TextStyle(
                fontSize: 12,
                color: Color(0xFFEAEAEA)
            ),
          ),
        ),
      ),
    );
  }

  Column buildBackground() {
    return Column(
          children: [
            Expanded(
              flex: 450,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/light-bg.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  )
                ),
              ),
            ),
            Expanded(
              flex: 574,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomBackButton(),
                ),
              ),
            ),
          ],
        );
  }
}
