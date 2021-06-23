import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/Models/SelectedMenu.dart';
import 'package:profoundgodlibrary/Views/HomeView.dart';
import 'package:provider/src/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<SelectedMenu>().selectedMenu;

    switch (selected) {
      case "Home":
        return HomeView();
      case "Search":
        return Container();
      case "Library":
        return Container();
      default:
        return Container();
    }
  }
}
