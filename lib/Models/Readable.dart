class Readable {
  final String name;
  String coverPicture;
  ReadableType readableType;

  Readable(this.name, this.coverPicture, this.readableType);
}

class Chapter {}

enum ReadableType { Manga, Novel }
