import 'package:profoundgodlibrary/src/Manga.dart';
import 'package:profoundgodlibrary/src/Novel.dart';
import 'package:profoundgodlibrary/src/helpers.dart';

class Readable {
  final String id;
  final String name;
  CoverPicture coverPicture;
  ReadableType readableType;

  Readable(
    this.name,
    this.coverPicture,
    this.readableType,
  ) : id = Helper.getID(name);

  Readable.fromJson(Map<String, dynamic> json)
      : id = Helper.getID(json['name']),
        name = json['name'],
        readableType =
            json["type"] == "novel" ? ReadableType.Novel : ReadableType.Manga,
        coverPicture = json['imageType'] == "local"
            ? CoverPicture(false, json['coverPicture'])
            : CoverPicture(true, json['coverPicture']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': readableType == ReadableType.Novel ? 'novel' : 'manga',
        'imageType': coverPicture.isOnline ? 'online' : 'local',
        'coverPicture': coverPicture.link,
      };

  Manga? toManga() {
    return readableType == ReadableType.Manga
        ? Manga(id, name, coverPicture)
        : null;
  }

  Novel? toNovel() {
    return readableType == ReadableType.Novel
        ? Novel(id, name, coverPicture)
        : null;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Chapter {}

enum ReadableType { Manga, Novel }

class CoverPicture {
  final bool isOnline;
  final String? link;
  const CoverPicture(this.isOnline, this.link);
}
