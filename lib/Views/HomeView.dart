import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/components.dart';
import 'package:profoundgodlibrary/components/AppBar.dart';
import 'package:profoundgodlibrary/src/database/database.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Database database;

  @override
  void initState() {
    super.initState();
    database = Database(context);
  }

  @override
  Widget build(BuildContext context) {
    var recents = database.library.data;
    var recentSearches = database.library.data;
    var shortcuts = database.library.data;
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
                  : RecentsView(readables: recents.values.toList()),
            ],
          ),
        )
      ],
    );
  }
}
