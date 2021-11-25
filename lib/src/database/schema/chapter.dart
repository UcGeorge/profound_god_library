import 'package:profoundgodlibrary/src/interfaces/jsonifiable.dart';

class Chapter extends Jsonifiable {
  final String name;
  final String link;
  bool downloaded;

  Chapter(this.name, this.link, {this.downloaded = false});
  Chapter.fromMeta(MetaChapter metaChapter)
      : name = metaChapter.name,
        link = metaChapter.link,
        downloaded = false;

  Chapter.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        link = json["link"],
        downloaded = json["downloaded"] == "true" ? true : false;

  @override
  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "downloaded": downloaded ? "true" : "false",
      };

  Future<void> download() async {
    downloaded = true;
  }
}

class MetaChapter {
  final String name;
  final String link;
  bool justUpdated;

  MetaChapter(this.name, this.link, {this.justUpdated = false});
  MetaChapter.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        link = json['link'],
        justUpdated = false;

  MetaChapter.fromChap(Chapter chapter)
      : name = chapter.name,
        link = chapter.link,
        justUpdated = false;
}
