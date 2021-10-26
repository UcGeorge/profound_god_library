import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/components.dart';
import 'package:profoundgodlibrary/src/LocalStorage.dart';
import 'package:profoundgodlibrary/src/Readable.dart';
import 'package:profoundgodlibrary/components/AppBar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Readable> recents;
  late List<Readable> recentSearches;
  late List<Readable> shortcuts;

  @override
  void initState() {
    super.initState();
    recentSearches = context.read<LocalStorage>().getRecentSearches();
    recents = context.read<LocalStorage>().getRecents();
    shortcuts = context.read<LocalStorage>().getShortcuts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PGLAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              recents.isEmpty && recentSearches.isEmpty && shortcuts.isEmpty
                  ? Container(
                      child: Center(
                        child: Text(
                          "It's lonely here...",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              recentSearches.isEmpty
                  ? SizedBox.shrink()
                  : RecentsView(readables: recents),
            ],
          ),
        )
      ],
    );
  }
}
