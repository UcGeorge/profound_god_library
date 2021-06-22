import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';

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
        await dataFile!.writeAsString('{}');
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
}
