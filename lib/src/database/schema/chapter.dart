import 'package:profoundgodlibrary/src/interfaces/jsonifiable.dart';

class Chapter extends Jsonifiable {
  final String name;
  final String link;
  bool downloaded;
  List<ChapterUnit>? chapterUnits;

  Chapter(this.name, this.link, {this.downloaded = false});
  Chapter.fromMeta(MetaChapter metaChapter)
      : name = metaChapter.name,
        link = metaChapter.link,
        downloaded = false;

  Chapter.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        link = json["link"],
        downloaded = json["downloaded"] == "true" ? true : false,
        chapterUnits = (json["chapterUnits"] as List)
            .map((e) => ChapterUnit.fromJson(e))
            .toList();

  @override
  Map<String, dynamic> toJson() => {
        "name": name,
        "link": link,
        "downloaded": downloaded ? "true" : "false",
        "chapterUnits": chapterUnits?.map((e) => e.toJson()).toList() ?? []
      };

  void setChapterUnits(List<ChapterUnit> chapterUnits) {
    this.chapterUnits = chapterUnits;
  }

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

enum ChapterUnitType { MANGA, NOVEL }

class ChapterUnit extends Jsonifiable {
  final ChapterUnitType type;
  final String? location;
  final String? content;

  ChapterUnit(this.type, {this.location, this.content}) {
    assert((location != null &&
            content == null &&
            type == ChapterUnitType.MANGA) ||
        (location == null && content != null && type == ChapterUnitType.NOVEL));
  }

  ChapterUnit.fromJson(Map<String, dynamic> json)
      : type = json['type'] == 'MANGA'
            ? ChapterUnitType.MANGA
            : ChapterUnitType.NOVEL,
        location = json['type'] == 'MANGA' ? json['location'] : null,
        content = json['type'] == 'NOVEL' ? json['content'] : null;

  @override
  Map<String, dynamic> toJson() => type == ChapterUnitType.MANGA
      ? {
          'type': type == ChapterUnitType.MANGA ? "MANGA" : "NOVEL",
          'location': location!
        }
      : {
          'type': type == ChapterUnitType.MANGA ? "MANGA" : "NOVEL",
          'content': content
        };
}
