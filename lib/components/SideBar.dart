import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:provider/src/provider.dart';

class SideBar extends StatefulWidget {
  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String hovered = 'null';
  void _setHovered(String hover) {
    setState(() {
      hovered = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<SelectedMenu>().selectedMenu;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF040404),
      ),
      height: double.infinity,
      width: 204.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 16),
            child: Icon(
              Icons.more_horiz,
              size: 20,
            ),
          ),
          Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (e) => _setHovered('Home'),
              onExit: (e) => _setHovered('null'),
              child: GestureDetector(
                onTap: () {
                  if (selected != "Home") {
                    context.read<SelectedMenu>().select("Home");
                  }
                },
                child: Container(
                  height: 36,
                  width: 188,
                  decoration: BoxDecoration(
                    color: selected == "Home" ? Color(0xFF282828) : null,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.home,
                          size: 16,
                          color: selected == "Home"
                              ? Colors.white
                              : (hovered == 'Home'
                                  ? Colors.white.withOpacity(0.8)
                                  : Colors.white.withOpacity(0.5)),
                        ),
                        SizedBox(
                          width: 16.7,
                        ),
                        Text(
                          "Home",
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: selected == "Home"
                                        ? Colors.white
                                        : (hovered == 'Home'
                                            ? Colors.white.withOpacity(0.8)
                                            : Colors.white.withOpacity(0.5)),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (e) => _setHovered('Search'),
              onExit: (e) => _setHovered('null'),
              child: GestureDetector(
                onTap: () {
                  if (selected != "Search") {
                    context.read<SelectedMenu>().select("Search");
                  }
                },
                child: Container(
                  height: 36,
                  width: 188,
                  decoration: BoxDecoration(
                    color: selected == "Search" ? Color(0xFF282828) : null,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.search_rounded,
                          size: 16,
                          color: selected == "Search"
                              ? Colors.white
                              : (hovered == 'Search'
                                  ? Colors.white.withOpacity(0.8)
                                  : Colors.white.withOpacity(0.5)),
                        ),
                        SizedBox(
                          width: 16.7,
                        ),
                        Text(
                          "Search",
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: selected == "Search"
                                        ? Colors.white
                                        : (hovered == 'Search'
                                            ? Colors.white.withOpacity(0.8)
                                            : Colors.white.withOpacity(0.5)),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (e) => _setHovered('Library'),
              onExit: (e) => _setHovered('null'),
              child: GestureDetector(
                onTap: () {
                  if (selected != "Library") {
                    context.read<SelectedMenu>().select("Library");
                  }
                },
                child: Container(
                  height: 36,
                  width: 188,
                  decoration: BoxDecoration(
                    color: selected == "Library" ? Color(0xFF282828) : null,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.menu_book,
                          size: 16,
                          color: selected == "Library"
                              ? Colors.white
                              : (hovered == 'Library'
                                  ? Colors.white.withOpacity(0.8)
                                  : Colors.white.withOpacity(0.5)),
                        ),
                        SizedBox(
                          width: 16.7,
                        ),
                        Text(
                          "Library",
                          style:
                              Theme.of(context).textTheme.headline2!.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color: selected == "Library"
                                        ? Colors.white
                                        : (hovered == 'Library'
                                            ? Colors.white.withOpacity(0.8)
                                            : Colors.white.withOpacity(0.5)),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(9.5),
            child: Divider(
              color: Color(0xFF303030),
              height: 1,
            ),
          ),
          //More stufffffffffff
          SizedBox.shrink(),
        ],
      ),
    );
  }
}
