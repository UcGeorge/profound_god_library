import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/Models/SelectedMenu.dart';
import 'package:profoundgodlibrary/Widgets/MainPage.dart';
import 'package:profoundgodlibrary/Widgets/SideBar.dart';
import 'package:provider/src/provider.dart';

import 'HomeView.dart';

class Shell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(child: MainPage()),
        ],
      ),
    );
  }
}
