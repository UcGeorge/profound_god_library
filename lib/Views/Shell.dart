import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/Views/ChapterView.dart';
import 'package:profoundgodlibrary/Views/DetailsView.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:profoundgodlibrary/components/MainPage.dart';
import 'package:profoundgodlibrary/components/SideBar.dart';
import 'package:profoundgodlibrary/src/chapter_view_state.dart';
import 'package:profoundgodlibrary/src/details_plane_state.dart';
import 'package:provider/src/provider.dart';

class Shell extends StatefulWidget {
  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    var _ = context.watch<SelectedMenu>();
    DetailsPlaneState detailsPlaneState =
        context.read<SelectedMenu>().detailsPlaneState;
    ChapterViewState chapterViewState =
        context.read<SelectedMenu>().chapterViewState;

    return Scaffold(
      body: chapterViewState.isNullState
          ? Row(
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
            )
          : ChapterView(chapterViewState),
    );
  }
}
