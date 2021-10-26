import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:profoundgodlibrary/src/data.dart';

import 'Readable.dart';

class LocalStorage extends ChangeNotifier {
  bool isBusy = true;
  Directory directory = Directory(r'C:\Users\Public\Documents\PGL');
  late File dataFile;
  late StateData stateData;
  String? errorMessage;
  bool hasError = false;

  List<Readable> getRecentSearches() => stateData.recentSearches;

  List<Readable> getRecents() => stateData.recents;

  List<Readable> getShortcuts() {
    var rs = [
      ...stateData.library['manga']!,
      ...stateData.library['novel']!,
    ];
    rs.shuffle();
    return rs;
  }

  List<Readable> getReadables(List<Map<String, dynamic>> category) {
    List<Readable> rS = [];

    for (Map<String, dynamic> a in category) rS.add(Readable.fromJson(a));
    print("For $category\nReturning: $rS");
    return rS;
  }

  void saveData() async {
    if (!await directory.exists()) {
      print("Creating directory");
      await directory.create(recursive: true);
    }

    dataFile = File(r'C:\Users\Public\Documents\PGL\data.json');
    await dataFile.writeAsString(
      stateData.toString(),
      mode: FileMode.write,
    );
  }

  void initializeDirectory() async {
    try {
      print("Initializing local storage");

      if (!await directory.exists()) {
        print("Creating directory");
        await directory.create(recursive: true);
      }

      dataFile = File(r'C:\Users\Public\Documents\PGL\data.json');
      if (!await dataFile.exists()) {
        stateData = StateData(
          recentSearches: [],
          recents: [],
          library: {"novel": [], "manga": []},
        );
        print("Creating data file:\n${stateData.toString()}");
        await dataFile.create(recursive: true);
        await dataFile.writeAsString(
          stateData.toString(),
          mode: FileMode.write,
        );
      } else {
        String contents = await dataFile.readAsString();
        stateData = StateData.fromJson(jsonDecode(contents));
      }

      print(directory.path);
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
}
