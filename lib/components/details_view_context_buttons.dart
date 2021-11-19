import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/details_plane_state.dart';
import 'package:provider/src/provider.dart';

class DetailsViewContextButtons extends StatefulWidget {
  final DetailsPlaneState detailsPlaneState;
  const DetailsViewContextButtons(this.detailsPlaneState, {Key? key})
      : super(key: key);

  @override
  _DetailsViewContextButtonsState createState() =>
      _DetailsViewContextButtonsState();
}

class _DetailsViewContextButtonsState extends State<DetailsViewContextButtons> {
  bool secondHover = false;

  void _toogleSecondHover(bool state) {
    setState(() {
      secondHover = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isInLibrary = context.watch<Database>().library.contains(
        (element) => element.id == widget.detailsPlaneState.readable!.id);
    return Row(
      children: [
        isInLibrary ? SizedBox.shrink() : addToLibrary(context),
        const Spacer(),
      ],
    );
  }

  MouseRegion addToLibrary(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _toogleSecondHover(true),
      onExit: (e) => _toogleSecondHover(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.detailsPlaneState.readable!.addToLibrary(context),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 25,
          width: 150,
          padding: EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                color: secondHover
                    ? Colors.transparent
                    : Colors.white.withOpacity(0.7),
                width: 1),
            color: secondHover
                ? Colors.white.withOpacity(0.7)
                : Colors.transparent,
          ),
          child: Center(
            child: Text(
              'Add to Library',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: secondHover
                    ? Color(0xff262626)
                    : Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //* MAY BE IMPORTANT LATER
  //* String _hoverText(BuildContext context, Readable readable) {
  //*   if (!context
  //*       .watch<Database>()
  //*       .library
  //*       .contains((element) => element.id == readable.id)) {
  //*     return 'Add to Library';
  //*   } else if (readable.lastChapterRead.isEmpty) {
  //*     return 'Start: ${widget.detailsPlaneState.readable!.readableDetails!.metaChapters!.last.name}';
  //*   } else {
  //*     return 'Continue: ${readable.lastChapterRead}';
  //*   }
  //* }
}
