import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/database/tables/table.dart';

class SearchHistory extends Schema<Readable> {
  SearchHistory(BuildContext context) : super('search-history', context);

  @override
  void initializeData() {
    data = jsonData
        .map((key, value) => MapEntry(key, Readable.fromDatabase(value)));
  }
}
