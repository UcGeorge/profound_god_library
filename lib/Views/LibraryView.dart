import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/LocalStorage.dart';
import 'package:profoundgodlibrary/src/Readable.dart';
import 'package:profoundgodlibrary/components/AppBar.dart';
import 'package:provider/provider.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  _LibraryViewState createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PGLAppBar(),
        Container(
          child: Center(
            child: Text(
              "Library hasn't been implemented boi!",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ],
    );
  }
}
