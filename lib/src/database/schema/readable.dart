import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/helpers.dart';
import 'package:profoundgodlibrary/src/interfaces/jsonifiable.dart';
import 'package:provider/src/provider.dart';

class Readable extends Jsonifiable {
  final String id;
  final String name;
  final ReadableType readableType;
  final String link;
  CoverPicture coverPicture;
  DateTime? lastRead;
  String lastChapterRead;
  List? chapters;
  ReadableDetails? _readableDetails;
  final String source;

  ReadableDetails? get readableDetails => _readableDetails;

  void setReadableDetails(
      ReadableDetails readableDetails, BuildContext context) {
    _readableDetails = readableDetails;
  }

  Readable(
    this.name,
    this.link,
    this.coverPicture,
    this.readableType,
    this.source,
    this.lastRead,
    this.lastChapterRead,
  ) : id = Helper.getID(name);

  Readable.fronServer(Map<String, dynamic> json)
      : id = Helper.getID(json['name']),
        name = json['name'],
        readableType =
            json["type"] == "novel" ? ReadableType.Novel : ReadableType.Manga,
        coverPicture = json['imageType'] == "local"
            ? CoverPicture(false, json['coverPicture'])
            : CoverPicture(true, json['coverPicture']),
        lastRead = (json['lastRead'] as String).isEmpty
            ? null
            : DateTime.parse(json['lastRead']),
        lastChapterRead = json['lastChapterRead'],
        link = json['link'],
        source = json['source'];

  Readable.fromDatabase(Map<String, dynamic> json)
      : id = Helper.getID(json['name']),
        name = json['name'],
        readableType =
            json["type"] == "novel" ? ReadableType.Novel : ReadableType.Manga,
        coverPicture = json['imageType'] == "local"
            ? CoverPicture(false, json['coverPicture'])
            : CoverPicture(true, json['coverPicture']),
        lastRead = (json['lastRead'] as String).isEmpty
            ? null
            : DateTime.parse(json['lastRead']),
        lastChapterRead = json['lastChapterRead'],
        _readableDetails = ReadableDetails(
            status: json['status'],
            rating: json['rating'],
            description: json['description'],
            chapterCount: (json['chapters']).length),
        chapters = json['chapters'],
        link = json['link'],
        source = json['source'];

  Map<String, dynamic> toJson() => {
        id: {
          'name': name,
          'link': link,
          'type': readableType == ReadableType.Novel ? 'novel' : 'manga',
          'imageType': coverPicture.isOnline ? 'online' : 'local',
          'coverPicture': coverPicture.link,
          'lastRead': lastRead?.toString() ?? '',
          'lastChapterRead': lastChapterRead,
          'status': readableDetails?.status ?? '',
          'rating': readableDetails?.rating ?? '',
          'description': readableDetails?.description ?? '',
          'chapters': chapters ?? [],
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

class ReadableDetails {
  final String status;
  final String rating;
  final String description;
  final int chapterCount;
  final List<MetaChapter>? metaChapters;

  ReadableDetails({
    required this.status,
    required this.rating,
    required this.description,
    required this.chapterCount,
    this.metaChapters,
  });

  ReadableDetails.fromServer(Map<String, dynamic> json)
      : status = json['status'].toString().trim(),
        rating = json['rating'].toString().trim(),
        description = json['description'].toString().trim(),
        chapterCount = json['chapter_count'],
        metaChapters = [
          for (Map<String, dynamic> e in json['chapters'])
            MetaChapter.fromJson(e)
        ];
}

class MetaChapter {
  final String name;
  final String link;

  MetaChapter(this.name, this.link);
  MetaChapter.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        link = json['link'];
}
