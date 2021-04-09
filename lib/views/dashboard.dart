import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profoundgodlibrary/bloc/theme_bloc.dart';
import 'package:profoundgodlibrary/components/DarkLightModeButton.dart';
import 'package:profoundgodlibrary/models/theme.dart';
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
      child: BlocBuilder<ThemeBloc, Map<ThemedComponent, dynamic>>(
        builder: (_, theme){
          return Scaffold(
            backgroundColor: theme[ThemedComponent.scaffold_bg],
            appBar: pglAppBar(),
            floatingActionButton: DlmButton(),
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
          );
        },
      ),
    );
  }
}
