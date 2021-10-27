import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/database/tables/library.dart';

class Database {
  Library library;

  Database(BuildContext context) : library = Library(context);
}
