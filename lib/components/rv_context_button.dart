import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';

typedef ToogleFlag = void Function();
typedef GestureTapCallback = void Function(ToogleFlag e);

class RVContextButton extends StatefulWidget {
  final double fullWidth;
  final Readable readable;
  final GestureTapCallback? action;
  final String text;
  final Icon icon;

  const RVContextButton(
    this.readable, {
    Key? key,
    this.action,
    required this.fullWidth,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  _RVContextButtonState createState() => _RVContextButtonState();
}

class _RVContextButtonState extends State<RVContextButton> {
  bool extendedHover = false;
  bool loading = false;

  void _toogleExtendedHover(PointerEvent e) {
    if (!mounted) return;
    setState(() {
      extendedHover = !extendedHover;
    });
  }

  void _toogleLoading() {
    if (!mounted) return;
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    loading = widget.readable.loading;
    return GestureDetector(
      onTap: widget.action == null
          ? () {}
          : () {
              widget.action!(_toogleLoading);
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
                  ? widget.fullWidth
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
                        widget.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Center(
                      child: widget.icon,
                    ),
        ),
      ),
    );
  }
}
