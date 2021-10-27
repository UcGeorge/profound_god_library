import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/src/LocalStorage.dart';
import 'package:profoundgodlibrary/components/AppBar.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
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
              "Search hasn't been implemented boi!",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ],
    );
  }
}
