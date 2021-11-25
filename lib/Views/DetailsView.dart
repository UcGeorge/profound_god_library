import 'dart:io';
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/components/chapter_item.dart';
import 'package:profoundgodlibrary/components/details_view_context_buttons.dart';
import 'package:profoundgodlibrary/components/dv_close_button.dart';
import 'package:profoundgodlibrary/components/rating_star.dart';
import 'package:profoundgodlibrary/components/smooth_scrollview.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
import 'package:profoundgodlibrary/src/database/schema/chapter.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/datasources/datasources.dart';
import 'package:profoundgodlibrary/src/details_plane_state.dart';
import 'package:provider/src/provider.dart';

class DetailsView extends StatefulWidget {
  final DetailsPlaneState detailsPlaneState;
  const DetailsView(
    this.detailsPlaneState, {
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  var rand = Random();
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    int sessionID = rand.nextInt(99999999);
    widget.detailsPlaneState.readable!.sessionID = sessionID;
    return Container(
      height: double.infinity,
      color: Color(0xff262626),
      child: widget.detailsPlaneState.readable!.readableDetails == null
          ? FutureBuilder(
              future: DataSources.details(
                  widget.detailsPlaneState.readable!.link,
                  widget.detailsPlaneState.readable!.source),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30),
                          Icon(
                            Icons.error_outline_rounded,
                            color: Colors.white.withOpacity(0.5),
                            size: 50,
                          ),
                          SizedBox(height: 5),
                          Text(
                            snapshot.error.toString(),
                            // 'Search returned no results!',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: Colors.white.withOpacity(0.8),
                                    fontWeight: FontWeight.normal),
                          ),
                        ],
                      );
                    }
                    print(
                        '[INFO] Readable details is null. Update flag is false');
                    widget.detailsPlaneState.readable!
                        .setReadableDetails(snapshot.data as ReadableDetails);
                    return _buildDetails(context, sessionID, updateFlag: false);
                  default:
                    return SpinKitSpinningLines(
                      color: Colors.white.withOpacity(0.8),
                      size: 50,
                    );
                }
              },
            )
          : _buildDetails(context, sessionID),
    );
  }

  Column _buildDetails(BuildContext context, int sessionID,
      {bool updateFlag = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: DVCloseButton(),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildCoverPhoto(),
              const SizedBox(width: 20),
              _buildName(context),
            ],
          ),
        ),
        Expanded(
          child: SmoothScrollView(
            controller: controller,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'DESCRIPTION',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.5),
                        letterSpacing: 1),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    widget.detailsPlaneState.readable!.readableDetails!
                        .description,
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.8),
                        letterSpacing: 0),
                  ),
                ),
                const SizedBox(height: 20),
                ..._buildChapterList(updateFlag, sessionID),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildChapterList(bool updateFlag, int sessionID) {
    bool noSavedChapters =
        widget.detailsPlaneState.readable!.readableDetails!.metaChapters ==
            null;
    return noSavedChapters || !updateFlag
        ? [
            Text(
              'CHAPTERS',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 11,
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: 1),
            ),
            ...widget.detailsPlaneState.readable!.readableDetails!.metaChapters
                    ?.map((e) =>
                        ChapterItem(e, widget.detailsPlaneState.readable!)) ??
                [],
          ]
        : [
            widget.detailsPlaneState.readable!.needsUpdate()
                ? FutureBuilder(
                    future:
                        widget.detailsPlaneState.readable!.update(sessionID),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return SizedBox.shrink();
                          }
                          List<MetaChapter> chaps =
                              (snapshot.data as List<MetaChapter>);
                          if (chaps.length > 0) {
                            Future.delayed(Duration.zero, () async {
                              widget.detailsPlaneState.readable!
                                  .updateChapters(context, chaps);
                            });

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: chaps
                                  .map((e) => ChapterItem(
                                      e, widget.detailsPlaneState.readable!))
                                  .toList(),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        default:
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Checking for updates',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2!
                                      .copyWith(
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
                    },
                  )
                : SizedBox.shrink(),
            ...widget.detailsPlaneState.readable!.readableDetails!.metaChapters!
                .map((e) => ChapterItem(e, widget.detailsPlaneState.readable!)),
          ];
  }

  Expanded _buildName(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.detailsPlaneState.readable!.name,
            maxLines: 3,
            overflow: TextOverflow.fade,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${widget.detailsPlaneState.readable!.readableType == ReadableType.Novel ? 'NOVEL' : 'MANGA'}  •  ${widget.detailsPlaneState.readable!.readableDetails?.chapterCount ?? 0} CHAPTERS',
            style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 11,
                color: Colors.white.withOpacity(0.5),
                letterSpacing: 1),
          ),
          const SizedBox(height: 5),
          Table(
            columnWidths: {0: FixedColumnWidth(50)},
            children: [
              TableRow(
                children: [
                  Text(
                    'Source',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.5),
                        letterSpacing: 1),
                  ),
                  Text(
                    widget.detailsPlaneState.readable!.source,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.8),
                        letterSpacing: 1),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Status',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.5),
                        letterSpacing: 1),
                  ),
                  Text(
                    widget.detailsPlaneState.readable!.readableDetails!.status,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.8),
                        letterSpacing: 1),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Rating',
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.5),
                        letterSpacing: 1),
                  ),
                  RatingStar(double.parse(widget
                      .detailsPlaneState.readable!.readableDetails!.rating)),
                ],
              )
            ],
          ),
          const SizedBox(height: 5),
          DetailsViewContextButtons(
            widget.detailsPlaneState,
            parentContext: context,
          )
        ],
      ),
    );
  }

  Widget _buildCoverPhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        height: 200,
        width: 200,
        child: widget.detailsPlaneState.readable!.coverPicture.isOnline
            ? Image.network(
                widget.detailsPlaneState.readable!.coverPicture.link,
                fit: BoxFit.cover,
                errorBuilder: (context, o, s) => Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: colors[widget.detailsPlaneState.readable!.id.length %
                        colors.length],
                  ),
                ),
              )
            : Image.file(
                File(widget.detailsPlaneState.readable!.coverPicture.link),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
