import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/dv_context_button.dart';
import 'package:profoundgodlibrary/components/hover_icons.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/details_plane_state.dart';
import 'package:provider/src/provider.dart';

class DetailsViewContextButtons extends StatelessWidget {
  final BuildContext parentContext;
  final DetailsPlaneState detailsPlaneState;
  const DetailsViewContextButtons(this.detailsPlaneState,
      {Key? key, required this.parentContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInLibrary = context
        .watch<Database>()
        .library
        .contains((element) => element.id == detailsPlaneState.readable!.id);
    return Row(
      children: [
        isInLibrary
            ? Row(
                children: [
                  detailsPlaneState.readable!.lastChapterRead.isEmpty
                      ? DVContextButton(
                          detailsPlaneState,
                          text:
                              'Start: ${detailsPlaneState.readable!.readableDetails!.metaChapters!.last.name}',
                          fullWidth: 165,
                          action: (toogleFlag) async {
                            //TODO: Implement chapters
                          },
                        )
                      : DVContextButton(
                          detailsPlaneState,
                          text:
                              'Continue: ${detailsPlaneState.readable!.lastChapterRead}',
                          fullWidth: 165,
                          action: (toogleFlag) async {
                            //TODO: Implement chapters
                          },
                        ),
                  SizedBox(width: 8),
                  DVContextButton(
                    detailsPlaneState,
                    icon: Icons.delete,
                    fullWidth: 25,
                    text: '',
                    iconSize: 16,
                    iconButton: true,
                    action: (toogleFlag) async {
                      toogleFlag();
                      context.read<SelectedMenu>().clearDetails();
                      context
                          .read<Database>()
                          .library
                          .delete(context, detailsPlaneState.readable!.id);
                      toogleFlag();
                    },
                  ),
                ],
              )
            : DVContextButton(
                detailsPlaneState,
                text: 'Add to Library',
                fullWidth: 150,
                action: (toogleFlag) async {
                  toogleFlag();
                  detailsPlaneState.readable!
                      .addToLibrary(parentContext)
                      .then((value) {
                    toogleFlag();
                  }).catchError((e) {
                    print(e);
                    toogleFlag();
                  });
                },
              ),
        const Spacer(),
      ],
    );
  }
}

//* MAY BE IMPORTANT LATER
  //* String _hoverText(BuildContext context, Readable readable) {
  //*   if (!context
  //*       .watch<Database>()
  //*       .library
  //*       .contains((element) => element.id == readable.id)) {
  //*     return 'Add to Library';
  //*   } else if (readable.lastChapterRead.isEmpty) {
  //*     return 'Start: ${widget.detailsPlaneState.readable!.readableDetails!.metaChapters!.last.name}';
  //*   } else {
  //*     return 'Continue: ${readable.lastChapterRead}';
  //*   }
  //* }