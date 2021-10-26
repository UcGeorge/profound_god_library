import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:profoundgodlibrary/components/MainPage.dart';
import 'package:profoundgodlibrary/components/SideBar.dart';
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
