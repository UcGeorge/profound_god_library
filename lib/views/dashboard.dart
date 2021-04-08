import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/DarkLightModeButton.dart';
import '../components/AppBar.dart';
import '../components/Demo.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: pglAppBar(),
        floatingActionButton: dlmButton(),
        body: TabBarView(
          children: [
            Center(
              child: Container(
                width: 1046.5,
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DemoReadingSection(),
                        DemoDiscoverSection(),
                      ],
                    ),
                  ),
              ),
            ),
            Center(
              child: Container(
                width: 1046.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DemoReadingSection(),
                      DemoDiscoverSection(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
