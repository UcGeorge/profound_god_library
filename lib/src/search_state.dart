import 'package:profoundgodlibrary/src/datasources/datasources.dart';
import 'package:profoundgodlibrary/src/k_state.dart';

class SearchState extends KState {
  final String? searchTerm;
  final SearchResults? searchResults;

  SearchState(this.searchTerm, {this.searchResults});
  SearchState.nullState()
      : searchTerm = null,
        searchResults = null,
        super.nullState();
}
