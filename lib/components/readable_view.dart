import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/components/readable_view_context_button.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:provider/src/provider.dart';

class ReadableView extends StatefulWidget {
  const ReadableView({
    Key? key,
    required this.readable,
  }) : super(key: key);

  final Readable readable;

  @override
  State<ReadableView> createState() => _ReadableViewState();
}

class _ReadableViewState extends State<ReadableView> {
  bool isHovering = false;

  void _toogleHover(PointerEvent e) {
    setState(() {
      isHovering = !isHovering;
    });
  }

  void showDetails() {
    context.read<SelectedMenu>().showDetails(widget.readable);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _toogleHover,
      onExit: _toogleHover,
      child: GestureDetector(
        onTap: showDetails,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: SizedBox(
                        height: 118,
                        width: 118,
                        child: widget.readable.coverPicture.isOnline
                            ? Image.network(
                                widget.readable.coverPicture.link,
                                fit: BoxFit.cover,
                                errorBuilder: (context, o, s) => Container(
                                  height: 118,
                                  width: 118,
                                  decoration: BoxDecoration(
                                    color: colors[widget.readable.id.length %
                                        colors.length],
                                  ),
                                ),
                              )
                            : Image.file(
                                File(widget.readable.coverPicture.link),
                                errorBuilder: (context, o, s) => Container(
                                  height: 118,
                                  width: 118,
                                  decoration: BoxDecoration(
                                    color: colors[widget.readable.id.length %
                                        colors.length],
                                  ),
                                ),
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
                      child:
                          ReadableViewContextButton(widget.readable, context),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
