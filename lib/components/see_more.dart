import 'package:flutter/material.dart';

class SeeMoreButton extends StatefulWidget {
  const SeeMoreButton({
    Key? key,
    required this.seeMore,
  }) : super(key: key);

  final VoidCallback seeMore;

  @override
  State<SeeMoreButton> createState() => _SeeMoreButtonState();
}

class _SeeMoreButtonState extends State<SeeMoreButton> {
  bool isHovering = false;

  void _toogleHover(PointerEvent e) {
    setState(() {
      isHovering = !isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.seeMore,
      child: MouseRegion(
        onEnter: _toogleHover,
        onExit: _toogleHover,
        cursor: SystemMouseCursors.click,
        child: Text(
          'SEE ALL',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 14,
                color: isHovering
                    ? Colors.white.withOpacity(0.8)
                    : Colors.white.withOpacity(0.5),
              ),
        ),
      ),
    );
  }
}

typedef VoidCallback = void Function();
