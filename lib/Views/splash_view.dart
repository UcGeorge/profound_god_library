import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:profoundgodlibrary/Models/LocalStorage.dart';
import 'package:profoundgodlibrary/Models/Network.dart';
import 'package:profoundgodlibrary/Models/SelectedMenu.dart';
import 'package:provider/provider.dart';
import 'Shell.dart';
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
    context.read<Network>().initConnection();
  }

  @override
  Widget build(BuildContext context) {
    final localStorageIsBusy = context.watch<LocalStorage>().isBusy;

    return localStorageIsBusy
        ? LoadingSplashScreen()
        : ChangeNotifierProvider(
            create: (context) => SelectedMenu(),
            child: Shell(),
          );
  }
}

class LoadingSplashScreen extends StatelessWidget {
  const LoadingSplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
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
