import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/AppBar.dart';
import 'package:profoundgodlibrary/components/readable_section.dart';
import 'package:profoundgodlibrary/components/search_results_view.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/helpers.dart';
import 'package:profoundgodlibrary/src/search_state.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView(this.searchState, {Key? key}) : super(key: key);
  final SearchState searchState;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    if (!widget.searchState.isNullState) {
      print('Searching for ${widget.searchState.searchTerm}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var recentSearches = Helper.sort<Readable>(
        context
            .watch<Database>()
            .library
            .select((element) => element.lastChapterRead.isNotEmpty)
            .values
            .toList(),
        (v1, v2) => v1.lastRead!.isAfter(v2.lastRead!));
    return Column(
      children: [
        PGLAppBar(),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: ListView(
              children: [
                widget.searchState.isNullState
                    ? SizedBox.shrink()
                    : SearchResultsView(widget: widget),
                recentSearches.isEmpty
                    ? SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: ReadableSection(
                          title: 'Recent Searches',
                          readables: recentSearches,
                          seeMore: () {},
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
