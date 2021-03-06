import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/database/tables/library.dart';
import 'package:profoundgodlibrary/src/database/tables/search_history.dart';

class Database extends ChangeNotifier {
  Library library;
  SearchHistory searchHistory;

  Database(BuildContext context)
      : library = Library(context),
        searchHistory = SearchHistory(context);

  void updateView() {
    notifyListeners();
  }
}
