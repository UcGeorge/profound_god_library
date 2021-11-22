import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/src/details_plane_state.dart';

typedef ToogleFlag = void Function();
typedef GestureTapCallback = void Function(ToogleFlag e);

class DVContextButton extends StatefulWidget {
  final String text;
  final bool iconButton;
  final IconData? icon;
  final double? iconSize;
  final double fullWidth;
  final GestureTapCallback? action;
  final DetailsPlaneState detailsPlaneState;
  const DVContextButton(this.detailsPlaneState,
      {Key? key,
      this.action,
      required this.fullWidth,
      required this.text,
      this.iconButton = false,
      this.icon,
      this.iconSize})
      : super(key: key);

  @override
  _DVContextButtonState createState() => _DVContextButtonState();
}

class _DVContextButtonState extends State<DVContextButton> {
  bool loading = false;
  bool hoverFlag = false;

  void _toogleHoverFlag(bool state) {
    if (!mounted) return;
    setState(() {
      hoverFlag = state;
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
    return MouseRegion(
      onEnter: (e) => _toogleHoverFlag(true),
      onExit: (e) => _toogleHoverFlag(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.action == null
            ? () {}
            : () {
                widget.action!(_toogleLoading);
              },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 25,
          width: loading
              ? 40
              : widget.iconButton
                  ? 25
                  : widget.fullWidth,
          padding: widget.iconButton
              ? EdgeInsets.only()
              : EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                color: hoverFlag
                    ? Colors.transparent
                    : Colors.white.withOpacity(0.7),
                width: 1),
            color:
                hoverFlag ? Colors.white.withOpacity(0.7) : Colors.transparent,
          ),
          child: Center(
            child: loading
                ? SpinKitThreeBounce(
                    color: hoverFlag
                        ? Colors.black.withOpacity(0.8)
                        : Colors.white.withOpacity(0.8),
                    size: 12,
                  )
                : widget.iconButton
                    ? Icon(
                        widget.icon,
                        color: hoverFlag
                            ? Colors.black.withOpacity(0.8)
                            : Colors.white.withOpacity(0.8),
                        size: widget.iconSize ?? 18,
                      )
                    : Text(
                        widget.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: hoverFlag
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
}
