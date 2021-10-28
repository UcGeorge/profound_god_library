import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/hover_icons.dart';
import 'package:profoundgodlibrary/components/readable_view.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';

class ReadableSection extends StatelessWidget {
  const ReadableSection({
    Key? key,
    required this.readables,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<Readable> readables;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 212,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: _buildNovels,
            itemCount: readables.length,
          ),
        )
      ],
    );
  }

  Widget _buildNovels(BuildContext context, int i) {
    return ReadableView(
      readable: readables[i],
      hoverIcon: _hoverIcon(context, readables[i]),
      hoverText: _hoverText(context, readables[i]),
    );
  }

  Widget _hoverIcon(BuildContext context, Readable readable) {
    if (!Database(context)
        .library
        .contains((element) => element.id == readable.id)) {
      return addToLibraryIcon;
    } else {
      return continueReadingIcon;
    }
  }

  String _hoverText(BuildContext context, Readable readable) {
    if (!Database(context)
        .library
        .contains((element) => element.id == readable.id)) {
      return '+ Library';
    } else if (readable.lastChapterRead == '') {
      return 'Start';
    } else {
      return 'Continue';
    }
  }
}
