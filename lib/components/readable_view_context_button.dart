import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/components/hover_icons.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:provider/src/provider.dart';

class ReadableViewContextButton extends StatefulWidget {
  final Readable readable;
  final BuildContext parentContext;
  const ReadableViewContextButton(this.readable, this.parentContext, {Key? key})
      : super(key: key);

  @override
  _ReadableViewContextButtonState createState() =>
      _ReadableViewContextButtonState();
}

class _ReadableViewContextButtonState extends State<ReadableViewContextButton> {
  bool extendedHover = false;
  bool loading = false;

  void _toogleExtendedHover(PointerEvent e) {
    setState(() {
      extendedHover = !extendedHover;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isInLibrary = context
        .watch<Database>()
        .library
        .contains((element) => element.id == widget.readable.id);
    return isInLibrary ? SizedBox.shrink() : _addToLibrary();
  }

  Widget _addToLibrary() {
    loading = widget.readable.loading;
    return GestureDetector(
      onTap: () async {
        setState(() {
          loading = true;
        });
        if (!mounted) {
          print('[ERROR] Widget not mounted: ${this}');
          return;
        }
        widget.readable.addToLibrary(widget.parentContext).then((value) {
          if (!mounted) return;
          setState(() {
            loading = false;
          });
        }).catchError((e) {
          print(e);
          if (!mounted) return;
          setState(() {
            loading = false;
          });
        });
      },
      child: MouseRegion(
        onEnter: _toogleExtendedHover,
        onExit: _toogleExtendedHover,
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          height: 25,
          width: loading
              ? 40
              : extendedHover
                  ? 70
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
          child: loading
              ? SpinKitThreeBounce(
                  color: Colors.black.withOpacity(0.8),
                  size: 12,
                )
              : extendedHover
                  ? Center(
                      child: Text(
                        'Library',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Center(
                      child: addToLibraryIcon,
                    ),
        ),
      ),
    );
  }
}

class AddToLibrary extends StatefulWidget {
  final Readable readable;
  const AddToLibrary(this.readable, {Key? key}) : super(key: key);

  @override
  _AddToLibraryState createState() => _AddToLibraryState();
}

class _AddToLibraryState extends State<AddToLibrary> {
  bool extendedHover = false;
  bool loading = false;

  void _toogleExtendedHover(PointerEvent e) {
    setState(() {
      extendedHover = !extendedHover;
    });
  }

  @override
  Widget build(BuildContext context) {
    loading = widget.readable.loading;
    return GestureDetector(
      onTap: () async {
        setState(() {
          loading = true;
        });
        print(context);
        await widget.readable.addToLibrary(context);
        setState(() {
          loading = false;
        });
      },
      child: MouseRegion(
        onEnter: _toogleExtendedHover,
        onExit: _toogleExtendedHover,
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          height: 25,
          width: loading
              ? 40
              : extendedHover
                  ? 70
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
          child: loading
              ? SpinKitThreeBounce(
                  color: Colors.black.withOpacity(0.8),
                  size: 12,
                )
              : extendedHover
                  ? Center(
                      child: Text(
                        'Library',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Center(
                      child: addToLibraryIcon,
                    ),
        ),
      ),
    );
  }
}
