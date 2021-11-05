import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/database/tables/table.dart';

class Library extends Schema<Readable> {
  Library(BuildContext context) : super('library', context);

  @override
  void initializeData() {
    data = jsonData
        .map((key, value) => MapEntry(key, Readable.fromDatabase(value)));
  }
}
