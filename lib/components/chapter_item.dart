import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/database/schema/chapter.dart';

class ChapterItem extends StatelessWidget {
  final MetaChapter chapter;
  const ChapterItem(this.chapter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.white.withOpacity(0.5),
          height: 20,
          thickness: 0.5,
        ),
        Row(
          children: [
            Text(
              chapter.name,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 11,
                  color: Colors.white.withOpacity(0.8),
                  letterSpacing: 1),
            ),
            Spacer(),
            chapter.justUpdated
                ? Container(
                    height: 18,
                    padding: EdgeInsets.only(left: 6, right: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.transparent,
                        border: Border.all(
                            color: Colors.white.withOpacity(0.5), width: 1)),
                    child: Center(
                      child: Text(
                        'New',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              fontSize: 10,
                              color: Colors.white.withOpacity(0.5),
                              letterSpacing: 1,
                            ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
