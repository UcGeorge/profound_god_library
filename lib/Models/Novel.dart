import 'package:profoundgodlibrary/Models/Readable.dart';
import 'package:profoundgodlibrary/Models/Source.dart';

class Novel extends Readable {
  List<Chapter>? chapters;
  Source? source;

  Novel(String name, String coverPicture, {this.source, this.chapters})
      : super(name, coverPicture, ReadableType.Novel);
}
