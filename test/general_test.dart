import 'dart:convert';
import 'dart:io';

import 'package:profoundgodlibrary/src/data.dart';

void main() async {
  Directory directory;
  File dataFile;
  late StateData stateData;

  print("Initializing local storage");

  directory = Directory(r'C:\Users\Public\Documents\PGL');
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
    await dataFile.writeAsString(stateData.toString());
  } else {
    String contents = await dataFile.readAsString();
    stateData = StateData.fromJson(jsonDecode(contents));
  }

  print(directory.path);
  print(stateData);
}
