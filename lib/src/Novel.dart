import 'package:profoundgodlibrary/src/Readable.dart';
import 'package:profoundgodlibrary/src/Source.dart';

class Novel extends Readable {
  List<Chapter>? chapters;
  Source? source;

  Novel(
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
