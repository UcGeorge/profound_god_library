import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/database/tables/table.dart';

class RecentlyRead extends Schema<Readable> {
  RecentlyRead(BuildContext context) : super('recents', context);

  @override
  void initializeData() {
    data =
        jsonData.map((key, value) => MapEntry(key, Readable.fromJson(value)));
  }
}
