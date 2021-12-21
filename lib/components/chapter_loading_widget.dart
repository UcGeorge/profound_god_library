import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:profoundgodlibrary/src/database/schema/chapter.dart';

class ChapterLoadingWidget extends StatelessWidget {
  const ChapterLoadingWidget({
    Key? key,
    required this.nextChapter,
  }) : super(key: key);

  final Chapter nextChapter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading ${nextChapter.name}',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 10,
                color: Colors.white.withOpacity(0.5),
                letterSpacing: 1),
          ),
          const SizedBox(width: 8),
          SpinKitThreeBounce(
            color: Colors.white.withOpacity(0.8),
            size: 12,
          )
        ],
      ),
    );
  }
}
