import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/Models/Network.dart';
import 'package:profoundgodlibrary/Models/SelectedMenu.dart';
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
                  color: Color(0xFF000000),
                  onPressed: context.read<SelectedMenu>().popStack.isEmpty
                      ? () {}
                      : () {
                          context.read<SelectedMenu>().pop();
                        },
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    size: 30,
                    color: context.read<SelectedMenu>().popStack.isEmpty
                        ? Theme.of(context).iconTheme.color!.withOpacity(0.3)
                        : Theme.of(context).iconTheme.color,
                  ),
                ),
                SizedBox(width: 20),
                IconButton(
                  color: Color(0xFF000000),
                  onPressed: context.read<SelectedMenu>().pushStack.isEmpty
                      ? () {}
                      : () {
                          context.read<SelectedMenu>().push();
                        },
                  icon: Icon(
                    Icons.chevron_right_rounded,
                    size: 30,
                    color: context.read<SelectedMenu>().pushStack.isEmpty
                        ? Theme.of(context).iconTheme.color!.withOpacity(0.3)
                        : Theme.of(context).iconTheme.color,
                  ),
                )
              ],
            ),
            Spacer(),
            !context.watch<Network>().isConnected
                ? Icon(
                    Icons.wifi_off_rounded,
                    size: 30,
                    color: Colors.red,
                  )
                : SizedBox.shrink(),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
