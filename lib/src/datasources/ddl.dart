import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/datasources/datasources.dart';

class DivineDaoLibrary extends DataSource {
  DivineDaoLibrary() : super('Divine Dao Library');

  @override
  String searchLink = '';

  @override
  List<Readable> search(String searchTerm) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
