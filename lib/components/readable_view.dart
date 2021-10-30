import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:provider/src/provider.dart';

class ReadableView extends StatefulWidget {
  const ReadableView({
    Key? key,
    required this.readable,
    required this.hoverIcon,
    required this.hoverText,
  }) : super(key: key);

  final Readable readable;
  final Widget hoverIcon;
  final String hoverText;

  @override
  State<ReadableView> createState() => _ReadableViewState();
}

class _ReadableViewState extends State<ReadableView> {
  bool isHovering = false;
  bool extendedHover = false;

  void _toogleHover(PointerEvent e) {
    setState(() {
      isHovering = !isHovering;
    });
  }

  void _toogleExtendedHover(PointerEvent e) {
    setState(() {
      extendedHover = !extendedHover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _toogleHover,
      onExit: _toogleHover,
      child: SizedBox(
        width: 146,
        height: 212,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 14, left: 14, right: 14),
              decoration: BoxDecoration(
                color: Color(0xff262626),
                // color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.readable.coverPicture.link == null
                      ? Container(
                          height: 118,
                          width: 118,
                          decoration: BoxDecoration(
                            color: colors[
                                widget.readable.id.length % colors.length],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                            height: 118,
                            width: 118,
                            child: widget.readable.coverPicture.isOnline
                                ? Image.network(
                                    widget.readable.coverPicture.link!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, o, s) => Container(
                                      height: 118,
                                      width: 118,
                                      decoration: BoxDecoration(
                                        color: colors[
                                            widget.readable.id.length %
                                                colors.length],
                                      ),
                                    ),
                                  )
                                : Image.file(
                                    File(widget.readable.coverPicture.link!),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                  SizedBox(height: 8),
                  Text(
                    widget.readable.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    widget.readable.readableType == ReadableType.Manga
                        ? 'Manga'
                        : 'Novel',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  )
                ],
              ),
            ),
            isHovering
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<Database>()
                            .library
                            .delete(context, widget.readable.id);
                      },
                      child: MouseRegion(
                        onEnter: _toogleExtendedHover,
                        onExit: _toogleExtendedHover,
                        cursor: SystemMouseCursors.click,
                        child: AnimatedContainer(
                          height: 25,
                          width: extendedHover
                              ? (widget.hoverText != 'Start' ? 80 : 60)
                              : 25,
                          duration: Duration(milliseconds: 100),
                          margin: EdgeInsets.only(bottom: 6, right: 6),
                          padding: extendedHover
                              ? EdgeInsets.only(left: 8, right: 8)
                              : EdgeInsets.only(),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white.withOpacity(0.7),
                          ),
                          child: extendedHover
                              ? Center(
                                  child: Text(
                                    widget.hoverText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: widget.hoverIcon,
                                ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
