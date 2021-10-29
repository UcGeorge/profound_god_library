import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/datasources/datasources.dart';

class Manganelo extends DataSource {
  Manganelo() : super('Manganelo');

  @override
  String searchLink = '';

  @override
  List<Readable> search(String searchTerm) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
