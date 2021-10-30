import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/search_box.dart';
import 'package:profoundgodlibrary/src/Network.dart';
import 'package:profoundgodlibrary/src/SelectedMenu.dart';
import 'package:provider/src/provider.dart';

class PGLAppBar extends StatelessWidget {
  const PGLAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 30),
            Row(
              children: [
                IconButton(
                  splashRadius: 15,
                  color: Color(0xFF000000),
                  onPressed: context.read<SelectedMenu>().popStack.isEmpty
                      ? () {}
                      : () {
                          context.read<SelectedMenu>().pop();
                        },
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    size: 25,
                    color: context.read<SelectedMenu>().popStack.isEmpty
                        ? Theme.of(context).iconTheme.color!.withOpacity(0.3)
                        : Theme.of(context).iconTheme.color,
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  splashRadius: 15,
                  color: Color(0xFF000000),
                  onPressed: context.read<SelectedMenu>().pushStack.isEmpty
                      ? () {}
                      : () {
                          context.read<SelectedMenu>().push();
                        },
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    size: 25,
                    color: context.read<SelectedMenu>().pushStack.isEmpty
                        ? Theme.of(context).iconTheme.color!.withOpacity(0.3)
                        : Theme.of(context).iconTheme.color,
                  ),
                )
              ],
            ),
            SizedBox(width: 20),
            context.read<SelectedMenu>().selectedMenu == 'Search'
                ? SearchBox()
                : SizedBox.shrink(),
            Spacer(),
            !context.watch<Network>().isConnected
                ? Icon(
                    Icons.wifi_off_rounded,
                    size: 20,
                    color: Colors.red,
                  )
                : SizedBox.shrink(),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
