import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/Models/LocalStorage.dart';
import 'package:profoundgodlibrary/Models/Readable.dart';
import 'package:profoundgodlibrary/Widgets/AppBar.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Readable>? recents;
  List<Readable>? recentSearches;
  List<Readable>? shortcuts;

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
      children: [
        PGLAppBar(),
        recents!.isEmpty && recentSearches!.isEmpty && shortcuts!.isEmpty
            ? Container(
                child: Center(
                  child: Text(
                    "It's lonely here...",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Text(
                    "There's some stuff here... apparently.\nRecents $recents\nRecent Searches $recentSearches\nShortcuts $shortcuts",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
      ],
    );
  }
}
