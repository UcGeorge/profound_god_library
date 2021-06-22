// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:profoundgodlibrary/Models/LocalStorage.dart';
import 'package:provider/provider.dart';
// import 'package:profoundgodlibrary/Widgets/Widgets.dart';

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    context.read<LocalStorage>().initializeDirectory();
  }

  @override
  Widget build(BuildContext context) {
    final localStorageIsBusy = context.watch<LocalStorage>().isBusy;

    return localStorageIsBusy
        ? Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Center(
              child: DefaultTextStyle(
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 7.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FlickerAnimatedText('Profound God Library'),
                    FlickerAnimatedText('Loading...'),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          )
        : Container();
  }
}

// WindowTitleBarBox(
//             child: Row(
//               children: [
//                 Expanded(child: MoveWindow()),
//                 WindowButtons(),
//               ],
//             ),
//           ),
