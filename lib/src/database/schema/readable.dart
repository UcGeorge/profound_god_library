import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/datasources/datasources.dart';
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
  List<Chapter> chapters;
  ReadableDetails? _readableDetails;
  final String source;
  DateTime? lastUpdated;
  bool loading = false;
  bool isUpdating = false;
  List<MetaChapter>? newChapters;
  bool viewIsMounted = false;

  ReadableDetails? get readableDetails => _readableDetails;

  void setReadableDetails(ReadableDetails? readableDetails) {
    _readableDetails = readableDetails;
    chapters = readableDetails?.metaChapters
            ?.map((e) => Chapter.fromMeta(e))
            .toList() ??
        [];
  }

  void updateChapters(BuildContext context, List<MetaChapter> metaChaps) {
    _updateSelfFromDb(context);
    _readableDetails!.metaChapters?.insertAll(0, metaChaps);
    chapters.insertAll(0, metaChaps.map((e) => Chapter.fromMeta(e)));
    context.read<Database>().library.update(context, id, this);
  }

  void _updateSelfFromDb(BuildContext context) {
    Readable? thisFromDb =
        context.read<Database>().library.select((r) => r.id == id)[id];
    lastRead = thisFromDb?.lastRead ?? lastRead;
    lastChapterRead = thisFromDb?.lastChapterRead ?? lastChapterRead;
    chapters = thisFromDb?.chapters ?? chapters;
  }

  Future<void> addToLibrary(BuildContext context) async {
    print(context);
    loading = true;
    Directory imageDir = Directory(r'C:\Users\Public\Documents\PGL\images');
    if (!await imageDir.exists()) {
      print('[INFO] PGL/images does not exist');
      await imageDir.create(recursive: true);
    }
    if (_readableDetails == null) {
      print('[INFO] Getting readable details');
      setReadableDetails(await DataSources.details(link, source));
    }
    if (coverPicture.isOnline) {
      print('[INFO] Downloading cover pic');
      var path = imageDir.path;
      var name =
          "\\${this.name}${coverPicture.link.substring(coverPicture.link.lastIndexOf('.'))}";
      var onlineLink = coverPicture.link;
      print('[INFO] Started download');
      await Helper.downloadImage(Uri.parse(onlineLink), path, name);
      coverPicture = CoverPicture(false, path + name);
    }
    print('[INFO] Updating library');
    context.read<Database>().library.insert(context, id, this);
    loading = false;
  }

  Readable(this.name, this.link, this.coverPicture, this.readableType,
      this.source, this.lastRead, this.lastChapterRead,
      {this.lastUpdated})
      : id = Helper.getID(name),
        chapters = [];

  Future<List<MetaChapter>> update() async {
    if (newChapters != null) {
      print('[INFO] New chapters is not null');
      lastUpdated = DateTime.now();
      var res = newChapters!;
      newChapters = null;
      return res;
    }
    if (!isUpdating) _getOnlineChapters();
    int timeout = 0;
    while (isUpdating) {
      await Future.delayed(Duration(seconds: 1));
      timeout++;
      if (timeout >= 60) {
        print('[INFO] Update timeout');
        return [];
      }
    }
    if (viewIsMounted) {
      print('[INFO] View is Mounted. Returning chapter updates');
      lastUpdated = DateTime.now();
      var res = newChapters;
      newChapters = null;
      return res!;
    } else {
      print('[INFO] View is Unmounted. Returning nothing');
      return [];
    }
  }

  void _getOnlineChapters() async {
    print('[INFO] Getting chapter updates');
    isUpdating = true;
    ReadableDetails? _readableDetails = await DataSources.details(link, source);
    newChapters = _readableDetails?.metaChapters
            ?.where((e1) => (readableDetails!.metaChapters!
                    .where((e2) => e2.name == e1.name)
                    .length ==
                0))
            .toList() ??
        [];
    isUpdating = false;
  }

  bool needsUpdate() {
    return lastUpdated != null ? DateTime.now().hour > lastUpdated!.hour : true;
  }

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
        source = json['source'],
        chapters = [];

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
            chapterCount: (json['chapters']).length,
            metaChapters: (json['chapters'] as List)
                .map((e) => MetaChapter.fromJson(e))
                .toList()),
        link = json['link'],
        source = json['source'],
        chapters =
            (json['chapters'] as List).map((e) => Chapter.fromJson(e)).toList();

  Map<String, dynamic> toJson() => {
        id: {
          'name': name,
          'link': link,
          'type': readableType == ReadableType.Novel ? 'novel' : 'manga',
          'imageType': coverPicture.isOnline ? 'online' : 'local',
          'coverPicture': coverPicture.link,
          'lastRead': lastRead?.toString() ?? '',
          'lastChapterRead': lastChapterRead,
          'status': _readableDetails?.status ?? '',
          'rating': _readableDetails?.rating ?? '',
          'description': _readableDetails?.description ?? '',
          'source': source,
          'chapters': chapters.map((e) => e.toJson()).toList()
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
  final String link;
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

  MetaChapter.fromChap(Chapter chapter)
      : name = chapter.name,
        link = chapter.link;
}

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
