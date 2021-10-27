import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/components.dart';
import 'package:profoundgodlibrary/components/AppBar.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
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
    demoData.forEach((key, value) {
      database.library.insert(key, value);
    });
  }

  @override
  Widget build(BuildContext context) {
    var recents = database.library.select((element) => element.id.length > 11);
    var recentSearches =
        database.library.select((element) => element.id.length <= 11);
    var shortcuts = database.library.data;
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PGLAppBar(),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
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
                recents.isEmpty
                    ? SizedBox.shrink()
                    : ReadableSection(
                        title: 'Continue Reading',
                        readables: recents.values.toList(),
                      ),
                SizedBox(height: 30),
                recentSearches.isEmpty
                    ? SizedBox.shrink()
                    : ReadableSection(
                        title: 'Recent Searches',
                        readables: recentSearches.values.toList(),
                      ),
                SizedBox(height: 30),
                recents.isEmpty
                    ? SizedBox.shrink()
                    : ReadableSection(
                        title: 'Shortcuts',
                        readables: recents.values.toList(),
                      ),
                SizedBox(height: 30),
              ],
            ),
          ),
        )
      ],
    );
  }
}
