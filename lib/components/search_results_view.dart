import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:profoundgodlibrary/Views/SearchView.dart';
import 'package:profoundgodlibrary/components/readable_section.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:profoundgodlibrary/src/datasources/datasources.dart';
import 'package:profoundgodlibrary/src/search_state.dart';
import 'package:provider/src/provider.dart';

class SearchResultsView extends StatelessWidget {
  const SearchResultsView({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final SearchView widget;

  @override
  Widget build(BuildContext context) {
    return widget.searchState.searchResults == null
        ? FutureBuilder(
            future: DataSources.search(widget.searchState.searchTerm!),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Icon(
                          Icons.error_outline_rounded,
                          color: Colors.white.withOpacity(0.5),
                          size: 50,
                        ),
                        SizedBox(height: 5),
                        Text(
                          snapshot.error.toString(),
                          // 'Search returned no results!',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.normal),
                        ),
                      ],
                    );
                  print('Has results');
                  context.read<SelectedMenu>().state = SearchState(
                    widget.searchState.searchTerm,
                    searchResults: (snapshot.data as SearchResults),
                  );
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (String source
                          in (snapshot.data as SearchResults).keys)
                        if ((snapshot.data as SearchResults)[source]!
                            .isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: ReadableSection(
                              title: source,
                              readables:
                                  (snapshot.data as SearchResults)[source]!,
                              seeMore: () {},
                            ),
                          ),
                    ],
                  );
                default:
                  return SpinKitSpinningLines(
                    color: Colors.white.withOpacity(0.8),
                    size: 50,
                  );
              }
            },
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (String source in widget.searchState.searchResults!.keys)
                if (widget.searchState.searchResults![source]!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: ReadableSection(
                      title: source,
                      readables: widget.searchState.searchResults![source]!,
                      seeMore: () {},
                    ),
                  ),
            ],
          );
  }
}
