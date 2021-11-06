import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/Views/DetailsView.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:profoundgodlibrary/components/MainPage.dart';
import 'package:profoundgodlibrary/components/SideBar.dart';
import 'package:profoundgodlibrary/src/details_plane_state.dart';
import 'package:provider/src/provider.dart';

class Shell extends StatefulWidget {
  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    DetailsPlaneState detailsPlaneState =
        context.watch<SelectedMenu>().detailsPlaneState;

    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          ...MediaQuery.of(context).size.width >= 1360
              ? [
                  Expanded(child: MainPage()),
                  detailsPlaneState.isNullState
                      ? SizedBox.shrink()
                      : SizedBox(
                          child: DetailsView(detailsPlaneState),
                          width: 600,
                          height: double.infinity,
                        ),
                ]
              : [
                  Expanded(
                    child: detailsPlaneState.isNullState
                        ? MainPage()
                        : DetailsView(detailsPlaneState),
                  )
                ],
        ],
      ),
    );
  }
}
