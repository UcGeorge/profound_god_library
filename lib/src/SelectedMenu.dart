import 'dart:collection';

import 'package:flutter/cupertino.dart';

class SelectedMenu extends ChangeNotifier {
  String selectedMenu = "Home";
  ListQueue<String> popStack = ListQueue(10);
  ListQueue<String> pushStack = ListQueue(10);

  select(String selection) {
    popStack.addFirst(selectedMenu);
    pushStack.clear();
    selectedMenu = selection;
    print(
        "Push ${pushStack.length > 0 ? pushStack.first : "..."}\nPop ${popStack.length > 0 ? popStack.first : "..."}");
    notifyListeners();
  }

  pop() {
    pushStack.addFirst(selectedMenu);
    selectedMenu = popStack.removeFirst();
    print(
        "Push ${pushStack.length > 0 ? pushStack.first : "..."}\nPop ${popStack.length > 0 ? popStack.first : "..."}");
    notifyListeners();
  }

  push() {
    popStack.addFirst(selectedMenu);
    selectedMenu = pushStack.removeFirst();
    print(
        "Push ${pushStack.length > 0 ? pushStack.first : "..."}\nPop ${popStack.length > 0 ? popStack.first : "..."}");
    notifyListeners();
  }
}
