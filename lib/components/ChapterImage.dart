import 'package:flutter/material.dart';

class ChapterImage extends StatefulWidget {
  const ChapterImage({
    Key key,
  }) : super(key: key);

  @override
  _ChapterImageState createState() => _ChapterImageState();
}

class _ChapterImageState extends State<ChapterImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 401,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/placeholder-image.png'),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          )
      ),
    );
  }
}