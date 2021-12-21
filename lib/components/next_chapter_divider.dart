import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/database/schema/chapter.dart';

class NextChapterDivider extends StatelessWidget {
  const NextChapterDivider({
    Key? key,
    required this.chapterName,
  }) : super(key: key);

  final String chapterName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              color: Colors.white.withOpacity(0.5),
              height: 2,
              // width: 250,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            chapterName,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 10,
                color: Colors.white.withOpacity(0.5),
                letterSpacing: 1),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              color: Colors.white.withOpacity(0.5),
              height: 2,
              // width: 250,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
