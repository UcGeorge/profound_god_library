export 'package:profoundgodlibrary/src/datasources/Manganelo.dart';
export 'package:profoundgodlibrary/src/datasources/WuxiaWorld.dart';

import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/datasources/Manganelo.dart';
import 'package:profoundgodlibrary/src/datasources/WuxiaWorld.dart';
import 'package:profoundgodlibrary/src/datasources/ddl.dart';

abstract class DataSource {
  String dataSourceID;
  abstract String searchLink;

  DataSource(this.dataSourceID);
  Future<List<Readable>> search(String searchTerm);
  // String searchLink();
}

class DataSources {
  static List<DataSource> dataSources = [
    Manganelo(),
    WuxiaWorld(),
    DivineDaoLibrary(),
  ];
  static Future<SearchResults> search(String searchTerm) async {
    return <String, List<Readable>>{
      for (DataSource d in dataSources)
        d.dataSourceID: await d.search(searchTerm)
    };
  }
}

typedef SearchResults = Map<String, List<Readable>?>;
