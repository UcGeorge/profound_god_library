import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import 'Readable.dart';

class LocalStorage extends ChangeNotifier {
  Directory? root;
  bool isBusy = true;
  Directory? directory;
  File? dataFile;
  Map<String, dynamic>? stateData;
  String? errorMessage;
  bool hasError = false;

  initializeDirectory() async {
    try {
      print("Initializing local storage");

      directory = Directory(r'C:\Users\Public\Documents\PGL');
      if (!await directory!.exists()) {
        print("Creating directory");
        await directory!.create(recursive: true);
      }

      dataFile = File(r'C:\Users\Public\Documents\PGL\data.json');
      if (!await dataFile!.exists()) {
        print("Creating data file");
        await dataFile!.create(recursive: true);
        await dataFile!.writeAsString(r'''
          {
            "Recent searches": [],
            "Recents": [],
            "Library": {
                "Novel": {},
                "Manga": {}
            }
          }''');
      }

      String contents = await dataFile!.readAsString();
      stateData = jsonDecode(contents);

      print(directory!.path);
      print(stateData);
      isBusy = false;
      notifyListeners();
    } catch (ex) {
      hasError = true;
      errorMessage = ex.toString();
      isBusy = false;
      notifyListeners();
      print(ex);
    }
  }

  List<Readable> getRecentSearches() {
    List<Readable> rS = [];
    List<dynamic> recentSearches = stateData!["Recent searches"];

    for (Map<String, dynamic> a in recentSearches) {
      String name = a["name"];
      String coverImage = a["coverImage"];
      ReadableType readableType =
          a["type"] == "Novel" ? ReadableType.Novel : ReadableType.Manga;
      rS.add(Readable(name, coverImage, readableType));
    }
    print("Returning $rS");
    return rS;
  }

  List<Readable> getRecents() {
    List<Readable> rS = [];
    List<dynamic> recents = stateData!["Recents"];

    for (Map<String, dynamic> a in recents) {
      String name = a["name"];
      String coverImage = a["coverImage"];
      ReadableType readableType =
          a["type"] == "Novel" ? ReadableType.Novel : ReadableType.Manga;
      rS.add(Readable(name, coverImage, readableType));
    }
    print("Returning $rS");
    return rS;
  }

  List<Readable> getShortcuts() {
    List<Readable> rS = [];
    Map<String, dynamic> mangaLibrary = stateData!["Library"]["Manga"];
    Map<String, dynamic> novelLibrary = stateData!["Library"]["Novel"];

    mangaLibrary.forEach((k, v) {
      String name = k;
      String coverImage = v["coverImage"];
      ReadableType readableType =
          v["type"] == "Novel" ? ReadableType.Novel : ReadableType.Manga;
      rS.add(Readable(name, coverImage, readableType));
    });

    novelLibrary.forEach((k, v) {
      String name = k;
      String coverImage = v["coverImage"];
      ReadableType readableType =
          v["type"] == "Novel" ? ReadableType.Novel : ReadableType.Manga;
      rS.add(Readable(name, coverImage, readableType));
    });

    rS.shuffle();
    print("Returning $rS");
    return rS;
  }
}
