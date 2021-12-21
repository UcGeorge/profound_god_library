import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/components/chapter_loading_widget.dart';
import 'package:profoundgodlibrary/components/cv_title_bar.dart';
import 'package:profoundgodlibrary/components/error_widget.dart' as err;
import 'package:profoundgodlibrary/components/manga_picture.dart';
import 'package:profoundgodlibrary/components/next_chapter_button.dart';
import 'package:profoundgodlibrary/components/next_chapter_divider.dart';
import 'package:profoundgodlibrary/components/smooth_scrollview.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
import 'package:profoundgodlibrary/src/chapter_view_state.dart';
import 'package:profoundgodlibrary/src/database/schema/chapter.dart';
import 'package:profoundgodlibrary/src/datasources/datasources.dart';

class ChapterView extends StatefulWidget {
  final ChapterViewState chapterViewState;
  const ChapterView(this.chapterViewState, {Key? key}) : super(key: key);

  @override
  _ChapterViewState createState() => _ChapterViewState();
}

class _ChapterViewState extends State<ChapterView> {
  late List<bool> nextButtons;
  List loaded = [];
  int currentChapterIndex = 0;

  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    Chapter currentChapter = widget.chapterViewState.readable!.chapters
        .where((element) =>
            element.name == widget.chapterViewState.startChapterName)
        .first;
    List<ChapterUnit> chapterUnits = currentChapter.chapterUnits ?? [];
    nextButtons =
        widget.chapterViewState.readable!.chapters.map((e) => false).toList();
    if (chapterUnits.isNotEmpty) {
      loaded.addAll(chapterUnits);
    }
    currentChapterIndex = widget.chapterViewState.readable!.chapters.indexOf(
        widget.chapterViewState.readable!.chapters
            .where((element) =>
                element.name == widget.chapterViewState.startChapterName)
            .first);
  }

  @override
  Widget build(BuildContext context) {
    Chapter currentChapter = widget.chapterViewState.readable!.chapters
        .where((element) =>
            element.name == widget.chapterViewState.startChapterName)
        .first;

    List<ChapterUnit> chapterUnits = currentChapter.chapterUnits ?? [];

    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: Container(
                // color: Colors.white.withOpacity(.5),
                child: chapterUnits.isEmpty
                    ? FutureBuilder(
                        future: DataSources.getChapter(currentChapter.link,
                            widget.chapterViewState.readable!.source),
                        builder: (context, snapshot) {
                          print('[INFO] Getting chapter units');
                          switch (snapshot.connectionState) {
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                print(
                                    '[ERROR] An error occoured while getting chapter units');
                                return err.ErrorWidget(
                                    snapshot.error.toString());
                              }
                              widget.chapterViewState.readable!
                                  .syncFromDB(context);
                              List<ChapterUnit> result =
                                  snapshot.data as List<ChapterUnit>;
                              currentChapter.setChapterUnits(result);
                              nextButtons = result.map((e) => false).toList();
                              loaded.addAll(result);
                              Future.delayed(Duration(seconds: 0), () {
                                widget.chapterViewState.readable!
                                    .syncToDB(context);
                              });
                              return _buildChapterContent(currentChapter);
                            default:
                              return SpinKitSpinningLines(
                                color: Colors.white.withOpacity(0.8),
                                size: 50,
                              );
                          }
                        },
                      )
                    : _buildChapterContent(currentChapter),
              ),
            ),
          ),
        ),
        CVTitleBar(
          widget: widget,
          chapterName: widget
              .chapterViewState.readable!.chapters[currentChapterIndex].name,
        ),
      ],
    );
  }

  bool isLastChapter() =>
      widget.chapterViewState.readable!.chapters.first.name ==
      widget.chapterViewState.readable!.chapters[currentChapterIndex].name;

  SmoothScrollView _buildChapterContent(Chapter currentChapter) {
    return SmoothScrollView(
      controller: controller,
      child: ListView.builder(
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
        itemCount: loaded.length + 1,
        itemBuilder: (context, i) {
          if (i < loaded.length && loaded[i] is String) {
            return NextChapterDivider(chapterName: loaded[i]);
          } else if (currentChapter.downloaded) {
            // TODO: Here, add support for novels too. currently only for manga.
            return Image.file(
              File(loaded[i].location!),
              fit: BoxFit.fitWidth,
            );
          } else if (i == loaded.length) {
            if (isLastChapter()) {
              return lastChapterNoticeWidget();
            } else {
              var nextChapterIndex = currentChapterIndex - 1;
              var nextChapter =
                  widget.chapterViewState.readable!.chapters[nextChapterIndex];

              if (nextButtons[nextChapterIndex]) {
                if (nextChapter.chapterUnits?.isNotEmpty ?? false) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    setState(() {
                      currentChapterIndex = nextChapterIndex;
                      loaded.add(nextChapter.name);
                      loaded.addAll(nextChapter.chapterUnits!);
                    });
                  });
                  return SizedBox.shrink();
                } else {
                  return nextChapter.chapterUnits?.isEmpty ?? true
                      ? FutureBuilder(
                          future: DataSources.getChapter(nextChapter.link,
                              widget.chapterViewState.readable!.source),
                          builder: (context, snapshot) {
                            print('[INFO] Getting chapter units');
                            switch (snapshot.connectionState) {
                              case ConnectionState.done:
                                if (snapshot.hasError) {
                                  print(
                                      '[ERROR] An error occoured while getting chapter units');
                                  return err.ErrorWidget(
                                      snapshot.error.toString());
                                }
                                widget.chapterViewState.readable!
                                    .syncFromDB(context);
                                List<ChapterUnit> result =
                                    snapshot.data as List<ChapterUnit>;
                                nextChapter.setChapterUnits(result);
                                WidgetsBinding.instance!
                                    .addPostFrameCallback((_) {
                                  setState(() {
                                    currentChapterIndex = nextChapterIndex;
                                    loaded.add(nextChapter.name);
                                    loaded.addAll(nextChapter.chapterUnits!);
                                  });
                                });

                                Future.delayed(Duration(seconds: 1), () {
                                  widget.chapterViewState.readable!
                                      .syncToDB(context);
                                });
                                return SizedBox.shrink();
                              default:
                                return ChapterLoadingWidget(
                                    nextChapter: nextChapter);
                            }
                          },
                        )
                      : SizedBox.shrink();
                }
              } else {
                return NextChapterButton(
                  onTap: () {
                    setState(() {
                      nextButtons[nextChapterIndex] = true;
                    });
                  },
                  nextChapterName: nextChapter.name,
                );
              }
            }
          } else {
            return MangaPicture(
              link: loaded[i].location!,
              widget: widget,
              referer: currentChapter.link,
            );
          }
        },
      ),
    );
  }

  Padding lastChapterNoticeWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'YOU HAVE REACHED THE END',
        textAlign: TextAlign.center,
      ),
    );
  }
}
