import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/dv_context_button.dart';
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
            ? DVContextButton(
                detailsPlaneState,
                text: 'Remove from Library',
                fullWidth: 165,
                action: (toogleFlag) async {
                  toogleFlag();
                  context
                      .read<Database>()
                      .library
                      .delete(context, detailsPlaneState.readable!.id);
                  toogleFlag();
                },
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
