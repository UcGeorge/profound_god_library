import 'package:flutter/material.dart';

import 'ItemCard.dart';
import 'Section.dart';

class DemoDiscoverSection extends StatelessWidget {
  const DemoDiscoverSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Discover',
      content: [
        NovelCardDiscover(
          title: 'Against the Gods',
          chapterNum: 1776,
          coverImage: AssetImage('assets/images/placeholder-image-2.jpg'),
        ),
        NovelCardDiscover(
          title: 'Ancient strengthening technique',
          chapterNum: 1786,
        ),
        NovelCardDiscover(
          title: 'Some other novel',
          chapterNum: 1010,
          coverImage: AssetImage('assets/images/274x363.jpg'),
        ),
        NovelCardDiscover(
          title: 'Some other novel',
          chapterNum: 1010,
          coverImage: AssetImage('assets/images/274x363.jpg'),
        ),
        NovelCardDiscover(
          title: 'Ancient strengthening technique',
          chapterNum: 1786,
        ),
        NovelCardDiscover(
          title: 'Against the Gods',
          chapterNum: 1776,
          coverImage: AssetImage('assets/images/placeholder-image-2.jpg'),
        ),
      ],
    );
  }
}

class DemoReadingSection extends StatelessWidget {
  const DemoReadingSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'Reading',
      content: [
        NovelCard(
          title: 'Against the Gods',
          chapterNum: 1776,
          coverImage: AssetImage('assets/images/placeholder-image-2.jpg'),
        ),
        NovelCard(
          title: 'Ancient strengthening technique',
          chapterNum: 1786,
        ),
        NovelCard(
          title: 'Some other novel',
          chapterNum: 1010,
          coverImage: AssetImage('assets/images/274x363.jpg'),
        ),
      ],
    );
  }
}