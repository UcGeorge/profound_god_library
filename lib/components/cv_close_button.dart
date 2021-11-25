import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:provider/src/provider.dart';

class CVCloseButton extends StatefulWidget {
  const CVCloseButton({Key? key}) : super(key: key);

  @override
  _CVCloseButtonState createState() => _CVCloseButtonState();
}

class _CVCloseButtonState extends State<CVCloseButton> {
  bool isHovering = false;
  void _toogleHover(PointerEvent e) {
    setState(() {
      isHovering = !isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _toogleHover,
      onExit: _toogleHover,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: context.read<SelectedMenu>().closeChapter,
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
