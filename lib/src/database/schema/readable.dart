import 'dart:convert';

import 'package:profoundgodlibrary/src/helpers.dart';
import 'package:profoundgodlibrary/src/interfaces/jsonifiable.dart';

class Readable extends Jsonifiable {
  final String id;
  final String name;
  final CoverPicture coverPicture;
  final ReadableType readableType;

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
        id: {
          'name': name,
          'type': readableType == ReadableType.Novel ? 'novel' : 'manga',
          'imageType': coverPicture.isOnline ? 'online' : 'local',
          'coverPicture': coverPicture.link,
        }
      };

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

enum ReadableType { Manga, Novel }

class CoverPicture {
  final bool isOnline;
  final String? link;
  const CoverPicture(this.isOnline, this.link);
}
