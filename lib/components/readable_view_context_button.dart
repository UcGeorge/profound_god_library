import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/hover_icons.dart';
import 'package:profoundgodlibrary/components/rv_context_button.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:provider/src/provider.dart';

class ReadableViewContextButton extends StatelessWidget {
  final Readable readable;
  final BuildContext parentContext;
  const ReadableViewContextButton(this.readable, this.parentContext, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isInLibrary = context
        .watch<Database>()
        .library
        .contains((element) => element.id == readable.id);
    return isInLibrary
        ? RVContextButton(
            readable,
            fullWidth: 74,
            icon: deleteIcon,
            text: 'Remove',
            action: (toogleFlag) async {
              toogleFlag();
              context.read<Database>().library.delete(context, readable.id);
              toogleFlag();
            },
          )
        : RVContextButton(
            readable,
            fullWidth: 70,
            icon: addToLibraryIcon,
            text: 'Library',
            action: (toogleFlag) async {
              toogleFlag();
              readable.addToLibrary(parentContext).then((value) {
                toogleFlag();
              }).catchError((e) {
                print(e);
                toogleFlag();
              });
            },
          );
  }
}
