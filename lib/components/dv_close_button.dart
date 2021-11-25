import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:provider/src/provider.dart';

class DVCloseButton extends StatefulWidget {
  const DVCloseButton({Key? key}) : super(key: key);

  @override
  _DVCloseButtonState createState() => _DVCloseButtonState();
}

class _DVCloseButtonState extends State<DVCloseButton> {
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
