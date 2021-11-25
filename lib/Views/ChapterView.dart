import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/cv_close_button.dart';
import 'package:profoundgodlibrary/src/chapter_view_state.dart';

class ChapterView extends StatefulWidget {
  final ChapterViewState chapterViewState;
  const ChapterView(this.chapterViewState, {Key? key}) : super(key: key);

  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xff262626),
        ),
        Container(
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
                    Text(widget.chapterViewState.startChapterName!),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
