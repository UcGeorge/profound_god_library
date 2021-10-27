import 'package:flutter/material.dart';
import 'package:profoundgodlibrary/components/readable_view.dart';
import 'package:profoundgodlibrary/constants/constants.dart';
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
          'Continue Reading',
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
      hoverIcon: continueReadingIcon,
      hoverText: 'Continue',
    );
  }
}
