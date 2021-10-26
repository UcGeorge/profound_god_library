import 'package:profoundgodlibrary/src/Readable.dart';
import 'Source.dart';

class Manga extends Readable {
  List<Chapter>? chapters;
  Source? source;

  Manga(
    id,
    name,
    coverPicture, {
    this.source,
    this.chapters,
  }) : super(
          name,
          coverPicture,
          ReadableType.Manga,
        );
}
