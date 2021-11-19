import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/components/details_view_context_buttons.dart';
import 'package:profoundgodlibrary/components/rating_star.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
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
  bool isHovering = false;
  void _toogleHover(PointerEvent e) {
    setState(() {
      isHovering = !isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color(0xff262626),
      padding: EdgeInsets.all(20),
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
                    print('Has results');
                    widget.detailsPlaneState.readable!
                        .setReadableDetails(snapshot.data as ReadableDetails);
                    return _buildDetails(context);
                  default:
                    return SpinKitSpinningLines(
                      color: Colors.white.withOpacity(0.8),
                      size: 50,
                    );
                }
              },
            )
          : _buildDetails(context),
    );
  }

  Column _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _closeButton(context),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _buildCoverPhoto(),
            const SizedBox(width: 20),
            _buildName(context),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView(
            controller: ScrollController(),
            children: [
              Text(
                'DESCRIPTION',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.5),
                    letterSpacing: 1),
              ),
              const SizedBox(height: 10),
              Text(
                widget.detailsPlaneState.readable!.readableDetails!.description,
                style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                    letterSpacing: 0),
              ),
              const SizedBox(height: 20),
              ..._buildChapterList(),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildChapterList() {
    return [
      widget.detailsPlaneState.readable!.readableDetails!.metaChapters == null
          ? SizedBox.shrink()
          : Text(
              'CHAPTERS',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: 11,
                  color: Colors.white.withOpacity(0.5),
                  letterSpacing: 1),
            ),
      ...widget.detailsPlaneState.readable!.readableDetails!.metaChapters
              ?.map((e) => Column(
                    children: [
                      Divider(
                        color: Colors.white.withOpacity(0.5),
                        height: 20,
                        thickness: 0.5,
                      ),
                      Row(
                        children: [
                          Text(
                            e.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 11,
                                    color: Colors.white.withOpacity(0.8),
                                    letterSpacing: 1),
                          ),
                          Spacer(),
                        ],
                      )
                    ],
                  )) ??
          []
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
          DetailsViewContextButtons(widget.detailsPlaneState)
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

  MouseRegion _closeButton(BuildContext context) {
    return MouseRegion(
      onEnter: _toogleHover,
      onExit: _toogleHover,
      child: GestureDetector(
        onTap: context.read<SelectedMenu>().clearDetails,
        child: Text(
          'CLOSE',
          style: Theme.of(context).textTheme.headline2!.copyWith(
              fontSize: 11,
              color: isHovering
                  ? Colors.white.withOpacity(0.8)
                  : Colors.white.withOpacity(0.5),
              letterSpacing: 1.5),
        ),
      ),
    );
  }
}
