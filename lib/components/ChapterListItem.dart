import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/constants/ChapterAttributes.dart';

class ChapterListItem extends StatelessWidget {
  final String name;
  final List<ChapterAttribute> attributes;

  ChapterListItem({this.name = 'Chapter Name', this.attributes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.5,
          width: double.infinity,
          color: Color(0xFFC4B7BF),
        ),
        Container(
          height: 57,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 24.5),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2F2F2F),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: buildAttributes(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  List<Widget> buildAttributes(){
    List<Widget> attributes = [];

    if(this.attributes == null){
      attributes.add(
          buildUnLikeAttribute()
      );
      return attributes;
    }

    if(this.attributes.contains(ChapterAttribute.NEW)){
      attributes.add(
          buildNewAttribute()
      );
      attributes.add(
          SizedBox(width: 15,)
      );
    }

    if(this.attributes.contains(ChapterAttribute.BOOKMARKED)){
      attributes.add(
          buildBookmarkAttribute()
      );
      attributes.add(
          SizedBox(width: 15,)
      );
    }

    if(this.attributes.contains(ChapterAttribute.LIKED)){
      attributes.add(
          buildLikeAttribute()
      );
    }else{
      attributes.add(
          buildUnLikeAttribute()
      );
    }

    return attributes;
  }

  FaIcon buildUnLikeAttribute() {
    return FaIcon(
      FontAwesomeIcons.heart,
      color: Color(0xFF80706A),
      size: 13,
    );
  }

  FaIcon buildLikeAttribute() {
    return FaIcon(
      FontAwesomeIcons.solidHeart,
      color: Color(0xFF80706A),
      size: 13,
    );
  }

  FaIcon buildBookmarkAttribute() {
    return FaIcon(
      FontAwesomeIcons.solidBookmark,
      color: Color(0xFF80706A),
      size: 13,
    );
  }

  Container buildNewAttribute() {
    return Container(
      height: 15.97,
      width: 38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xFF80706A),
      ),
      child: Center(
        child: Text(
          'new',
          style: TextStyle(
            fontSize: 10,
            color: Color(0xFFEAEAEA),
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}