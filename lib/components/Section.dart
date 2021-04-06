import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/ItemCard.dart';

import 'SectionHeader.dart';

class Section extends StatelessWidget {
  final String title;
  final List<Widget> content;

  Section({this.title, @required List<Widget> content}): content = content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 21.5, right: 21.5, top: 30),
      child: Column(
        children: [
          SectionHeader(title: title,),
          buildContentLayout(),
        ],
      ),
    );
  }

  Widget buildContentLayout(){
    List<Widget> tempCol = [];
    for(int i = 0; i < content.length~/3 + 1; i++){
      //print(i);
      List<Widget> tempRow = [];
      for(int j = 1; j<=3; j++){
        int contentIndex = (i*3)+j-1;
        if(contentIndex >= content.length){
          // ignore: unnecessary_statements
          title == 'Discover' ? tempRow.add(DiscoverCard()) : null;
          break;
        }
        //print('index: '+contentIndex.toString());
        tempRow.add(content[(i*3)+j-1]);
        tempRow.add(j == 3 ? SizedBox(width: 0,) : SizedBox(width: 46,));
      }
      tempCol.add(
        Row(
          children: tempRow,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        ),
      );
      tempCol.add(i == content.length-1 ? SizedBox(height: 0,) : SizedBox(height: 45,));
    }

    return Column(
      children: tempCol,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}