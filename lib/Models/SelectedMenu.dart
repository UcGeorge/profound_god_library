import 'package:flutter/cupertino.dart';

class SelectedMenu extends ChangeNotifier {
  String selectedMenu = "Home";

  select(String selection) {
    selectedMenu = selection;
    notifyListeners();
  }
}
