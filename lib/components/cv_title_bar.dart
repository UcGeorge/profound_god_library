import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/Views/ChapterView.dart';
import 'package:profoundgodlibrary/components/cv_close_button.dart';

class CVTitleBar extends StatelessWidget {
  const CVTitleBar({
    Key? key,
    required this.widget,
    required this.chapterName,
  }) : super(key: key);

  final ChapterView widget;
  final String chapterName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Color(0xff121212),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CVCloseButton(), Spacer()],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.chapterViewState.readable!.name),
                Text(chapterName),
              ],
            ),
          )
        ],
      ),
    );
  }
}
