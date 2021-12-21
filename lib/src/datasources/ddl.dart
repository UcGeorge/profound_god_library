import 'package:profoundgodlibrary/src/database/schema/chapter.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/datasources/datasources.dart';

class DivineDaoLibrary extends DataSource {
  DivineDaoLibrary() : super('Divine Dao Library');

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

  @override
  Future<List<ChapterUnit>> getChapter(String linkl) {
    // TODO: implement getChapter
    throw UnimplementedError();
  }
}
