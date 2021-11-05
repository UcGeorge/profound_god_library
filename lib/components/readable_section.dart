import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/components.dart';
import 'package:profoundgodlibrary/components/hover_icons.dart';
import 'package:profoundgodlibrary/components/readable_view.dart';
import 'package:profoundgodlibrary/src/database/database.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';

class ReadableSection extends StatelessWidget {
  const ReadableSection({
    Key? key,
    required this.readables,
    required this.title,
    required this.seeMore,
  }) : super(key: key);

  final String title;
  final List<Readable> readables;
  final VoidCallback seeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
            readables.length > 10
                ? SeeMoreButton(seeMore: seeMore)
                : SizedBox.shrink(),
          ],
        ),
        SizedBox(height: 15),
        Wrap(
          runSpacing: 15,
          spacing: 15,
          children: [
            for (int i = 0;
                i < (readables.length <= 10 ? readables.length : 10);
                i++)
              _buildNovels(context, i)
          ],
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
    } else if (readable.lastChapterRead.isEmpty) {
      return startReadingIcon;
    } else {
      return continueReadingIcon;
    }
  }

  String _hoverText(BuildContext context, Readable readable) {
    if (!Database(context)
        .library
        .contains((element) => element.id == readable.id)) {
      return 'Library';
    } else if (readable.lastChapterRead.isEmpty) {
      return 'Start';
    } else {
      return 'Continue';
    }
  }
}
