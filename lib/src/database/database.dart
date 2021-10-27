import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/recent_searches_view.dart';
import 'package:profoundgodlibrary/src/database/tables/library.dart';
import 'package:profoundgodlibrary/src/database/tables/recently_read.dart';
import 'package:profoundgodlibrary/src/database/tables/recently_searched.dart';

class Database {
  Library library;
  RecentlySearched recentlySearched;
  RecentlyRead recentlyRead;

  Database(BuildContext context)
      : library = Library(context),
        recentlySearched = RecentlySearched(context),
        recentlyRead = RecentlyRead(context);
}
