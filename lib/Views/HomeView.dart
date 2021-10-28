import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/components.dart';
import 'package:profoundgodlibrary/components/AppBar.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/helpers.dart';
import 'package:provider/src/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration.zero,
        () => demoData.forEach((key, value) {
              context.read<Database>().library.insert(context, key, value);
            }));
  }

  @override
  Widget build(BuildContext context) {
    var recents = Helper.sort<Readable>(
        context
            .watch<Database>()
            .library
            .select((element) => element.lastRead != null)
            .values
            .toList(),
        (v1, v2) => v1.lastRead!.isAfter(v2.lastRead!));

    var recentSearches = context.watch<Database>().searchHistory.data;

    var shortcuts = context.watch<Database>().library.data;

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
                        readables: recents,
                      ),
                recents.isEmpty ? SizedBox.shrink() : SizedBox(height: 30),
                recentSearches.isEmpty
                    ? SizedBox.shrink()
                    : ReadableSection(
                        title: 'Recent Searches',
                        readables: recentSearches.values.toList(),
                      ),
                recentSearches.isEmpty
                    ? SizedBox.shrink()
                    : SizedBox(height: 30),
                shortcuts.isEmpty
                    ? SizedBox.shrink()
                    : ReadableSection(
                        title: 'Shortcuts',
                        readables: shortcuts.values.toList(),
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
