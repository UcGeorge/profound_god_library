import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextChapterButton extends StatefulWidget {
  final VoidCallback onTap;
  final String nextChapterName;
  const NextChapterButton(
      {Key? key, required this.onTap, required this.nextChapterName})
      : super(key: key);

  @override
  _NextChapterButtonState createState() => _NextChapterButtonState();
}

class _NextChapterButtonState extends State<NextChapterButton> {
  bool hoverFlag = false;

  void _toogleHoverFlag(bool state) {
    if (!mounted) return;
    setState(() {
      hoverFlag = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _toogleHoverFlag(true),
      onExit: (e) => _toogleHoverFlag(false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: 40,
          width: 40,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:
                hoverFlag ? Colors.white.withOpacity(0.15) : Colors.transparent,
          ),
          child: Center(
            child: Text(
              "Next: ${widget.nextChapterName}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
