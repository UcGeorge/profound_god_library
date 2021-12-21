import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/Views/ChapterView.dart';
import 'package:profoundgodlibrary/constants/constants.dart';

class MangaPicture extends StatelessWidget {
  const MangaPicture({
    Key? key,
    required this.link,
    required this.widget,
    required this.referer,
  }) : super(key: key);

  final String link;
  final String referer;
  final ChapterView widget;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      link,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              color: Color(0xff262626),
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      headers: {'referer': referer},
      fit: BoxFit.fitWidth,
      errorBuilder: (context, o, s) => Container(
        decoration: BoxDecoration(
          color: colors[
              widget.chapterViewState.readable!.id.length % colors.length],
        ),
      ),
    );
  }
}
