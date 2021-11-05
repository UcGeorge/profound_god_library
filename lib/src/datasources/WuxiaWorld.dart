import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/datasources/datasources.dart';

class WuxiaWorld extends DataSource {
  WuxiaWorld() : super('Wuxia World');

  @override
  String searchLink = '';

  @override
  Future<List<Readable>> search(String searchTerm) async {
    // TODO: implement search
    // throw UnimplementedError();
    return <Readable>[];
  }

  @override
  Future<ReadableDetails?> details(String link) async {
    // TODO: implement details
    throw UnimplementedError();
  }
}
