import 'package:profoundgodlibrary/Models/Readable.dart';
import 'Source.dart';

class Manga extends Readable {
  List<Chapter>? chapters;
  Source? source;

  Manga(String name, String coverPicture, {this.source, this.chapters})
      : super(name, coverPicture, ReadableType.Manga);
}
