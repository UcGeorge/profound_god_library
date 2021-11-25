import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/database/schema/chapter.dart';

class ChapterItem extends StatefulWidget {
  final MetaChapter chapter;
  const ChapterItem(this.chapter, {Key? key}) : super(key: key);

  @override
  State<ChapterItem> createState() => _ChapterItemState();
}

class _ChapterItemState extends State<ChapterItem> {
  bool isHovering = false;

  void _toogleHover(PointerEvent e) {
    setState(() {
      isHovering = !isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Implement chapters
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: _toogleHover,
        onExit: _toogleHover,
        child: Container(
          color: isHovering ? Colors.white.withOpacity(0.05) : null,
          child: Column(
            children: [
              Divider(
                color: Colors.white.withOpacity(0.5),
                height: 1,
                thickness: 0.5,
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      widget.chapter.name,
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontSize: 11,
                          color: Colors.white.withOpacity(0.8),
                          letterSpacing: 1),
                    ),
                    Spacer(),
                    widget.chapter.justUpdated
                        ? Container(
                            height: 18,
                            padding: EdgeInsets.only(left: 6, right: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 1)),
                            child: Center(
                              child: Text(
                                'New',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(0.5),
                                      letterSpacing: 1,
                                    ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
