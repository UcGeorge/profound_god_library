import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:profoundgodlibrary/src/chapter_view_state.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/details_plane_state.dart';
import 'package:profoundgodlibrary/src/k_state.dart';

class SelectedMenu extends ChangeNotifier {
  String selectedMenu = "Home";
  KState state = KState.nullState();
  DetailsPlaneState detailsPlaneState = DetailsPlaneState.nullState();
  ChapterViewState chapterViewState = ChapterViewState.nullState();
  ListQueue<String> popStack = ListQueue(10);
  ListQueue<String> pushStack = ListQueue(10);
  ListQueue<KState> popState = ListQueue(10);
  ListQueue<KState> pushState = ListQueue(10);

  showChapter(Readable readable, String startChapterName) {
    detailsPlaneState.readable!.sessionID = null;
    chapterViewState = ChapterViewState(readable, startChapterName);
    notifyListeners();
  }

  closeChapter() {
    chapterViewState = ChapterViewState.nullState();
    notifyListeners();
  }

  showDetails(Readable readable) {
    detailsPlaneState.readable?.sessionID = null;
    detailsPlaneState = DetailsPlaneState(readable);
    notifyListeners();
  }

  clearDetails() {
    detailsPlaneState.readable!.sessionID = null;
    detailsPlaneState = DetailsPlaneState.nullState();
    notifyListeners();
  }

  select(String selection, {KState? newState}) {
    popStack.addFirst(selectedMenu);
    popState.addFirst(state);
    pushStack.clear();
    pushState.clear();
    selectedMenu = selection;
    state = newState ?? KState.nullState();
    print(
        "Push ${pushStack.length > 0 ? pushStack.first : "..."}\nPop ${popStack.length > 0 ? popStack.first : "..."}");
    notifyListeners();
  }

  pop() {
    pushStack.addFirst(selectedMenu);
    pushState.addFirst(state);
    selectedMenu = popStack.removeFirst();
    state = popState.removeFirst();
    print(
        "Push ${pushStack.length > 0 ? pushStack.first : "..."}\nPop ${popStack.length > 0 ? popStack.first : "..."}");
    notifyListeners();
  }

  push() {
    popStack.addFirst(selectedMenu);
    popState.addFirst(state);
    selectedMenu = pushStack.removeFirst();
    state = pushState.removeFirst();
    print(
        "Push ${pushStack.length > 0 ? pushStack.first : "..."}\nPop ${popStack.length > 0 ? popStack.first : "..."}");
    notifyListeners();
  }
}
