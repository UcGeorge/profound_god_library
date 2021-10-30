import 'package:profoundgodlibrary/src/k_state.dart';

class SearchState extends KState {
  final String? searchTerm;

  SearchState(this.searchTerm);
  SearchState.nullState()
      : searchTerm = null,
        super.nullState();
}
