import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/database/tables/table.dart';

class RecentlySearched extends Schema<Readable> {
  RecentlySearched(BuildContext context) : super('recent-searches', context);

  @override
  void initializeData() {
    data =
        jsonData.map((key, value) => MapEntry(key, Readable.fromJson(value)));
  }
}
