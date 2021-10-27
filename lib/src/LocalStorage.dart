import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:profoundgodlibrary/src/interfaces/types.dart';

class LocalStorage extends ChangeNotifier {
  bool isBusy = true;
  Directory directory = Directory(r'C:\Users\Public\Documents\PGL');
  File dataFile = File(r'C:\Users\Public\Documents\PGL\database.json');
  late Map<String, dynamic> stateData;

  String? errorMessage;
  bool hasError = false;

  void _saveData() async {
    while (true) {
      print('saving data');
      if (!await directory.exists()) {
        print("Creating directory");
        await directory.create(recursive: true);
      }

      await dataFile.writeAsString(
        jsonEncode(stateData),
        mode: FileMode.write,
      );
      await Future.delayed(Duration(seconds: 10));
    }
  }

  void initializeDirectory() async {
    try {
      print("Initializing local storage");

      if (!await directory.exists()) {
        print("Creating directory");
        await directory.create(recursive: true);
      }

      dataFile = File(r'C:\Users\Public\Documents\PGL\database.json');
      if (!await dataFile.exists()) {
        stateData = {};
        await dataFile.create(recursive: true);
        await dataFile.writeAsString(
          stateData.toString(),
          mode: FileMode.write,
        );
      } else {
        String contents = await dataFile.readAsString();
        stateData = jsonDecode(contents);
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
      print('initializeDirectory exception: $ex');
    }
    print("Initializing local storage");
    _saveData();
  }
}
