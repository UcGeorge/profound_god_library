import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';

Map<String, Readable> demoData = {
  "martialpeak": Readable.fromJson({
    "name": "Martial Peak",
    "coverPicture": "C:/Users/Public/Documents/PGL/images/600.jpg",
    "type": "novel",
    "imageType": "local",
    "lastRead": '',
    "lastChapterRead": '',
    "chapters": {}
  }),
  "ninestarhegemonbodyart": Readable.fromJson({
    "name": "Nine Star Hegemon Body Art",
    "coverPicture": "C:/Users/Public/Documents/PGL/Manga/TestManga/cover.jpg",
    "type": "manga",
    "imageType": "local",
    "lastRead": DateTime.now().toString(),
    "lastChapterRead": 'chapter 1',
    "chapters": {}
  }),
  "starmartialgodtechnique": Readable.fromJson({
    "name": "Star Martial God Technique",
    "coverPicture": "C:/Users/Public/Documents/PGL/images/mw.png",
    "type": "novel",
    "imageType": "local",
    "lastRead": '',
    "lastChapterRead": '',
    "chapters": {}
  }),
  "talesofdemonsandgods": Readable.fromJson({
    "name": "Tales Of Demons and Gods",
    "coverPicture": "C:/Users/Public/Documents/PGL/images/30361129._SX318_.jpg",
    "type": "novel",
    "imageType": "local",
    "lastRead": '',
    "lastChapterRead": '',
    "chapters": {}
  }),
  "martialpeaka": Readable.fromJson({
    "name": "Martial Peaka",
    "coverPicture": "C:/Users/Public/Documents/PGL/images/600.jpg",
    "type": "novel",
    "imageType": "local",
    "lastRead": '',
    "lastChapterRead": '',
    "chapters": {}
  }),
  "ninestarhegemonbodyarta": Readable.fromJson({
    "name": "Nine Star Hegemon Body Arta",
    "coverPicture": "C:/Users/Public/Documents/PGL/Manga/TestManga/cover.jpg",
    "type": "manga",
    "imageType": "local",
    "lastRead": DateTime.now().toString(),
    "lastChapterRead": 'chapter 1',
    "chapters": {}
  }),
  "starmartialgodtechniquea": Readable.fromJson({
    "name": "Star Martial God Techniquea",
    "coverPicture": "C:/Users/Public/Documents/PGL/images/mw.png",
    "type": "novel",
    "imageType": "local",
    "lastRead": '',
    "lastChapterRead": '',
    "chapters": {}
  }),
  "talesofdemonsandgodsa": Readable.fromJson({
    "name": "Tales Of Demons and Godsa",
    "coverPicture": "C:/Users/Public/Documents/PGL/images/30361129._SX318_.jpg",
    "type": "novel",
    "imageType": "local",
    "lastRead": '',
    "lastChapterRead": '',
    "chapters": {}
  }),
  "martialpeakb": Readable.fromJson({
    "name": "Martial Peakb",
    "coverPicture": "C:/Users/Public/Documents/PGL/images/600.jpg",
    "type": "novel",
    "imageType": "local",
    "lastRead": '',
    "lastChapterRead": '',
    "chapters": {}
  }),
  "ninestarhegemonbodyartb": Readable.fromJson({
    "name": "Nine Star Hegemon Body Artb",
    "coverPicture": "C:/Users/Public/Documents/PGL/Manga/TestManga/cover.jpg",
    "type": "manga",
    "imageType": "local",
    "lastRead": DateTime.now().toString(),
    "lastChapterRead": 'chapter 1',
    "chapters": {}
  }),
  "starmartialgodtechniqueb": Readable.fromJson({
    "name": "Star Martial God Techniqueb",
    "coverPicture": "C:/Users/Public/Documents/PGL/images/mw.png",
    "type": "novel",
    "imageType": "local",
    "lastRead": '',
    "lastChapterRead": '',
    "chapters": {}
  }),
  "talesofdemonsandgodsb": Readable.fromJson({
    "name": "Tales Of Demons and Godsb",
    "coverPicture": "C:/Users/Public/Documents/PGL/images/30361129._SX318_.jpg",
    "type": "novel",
    "imageType": "local",
    "lastRead": '',
    "lastChapterRead": '',
    "chapters": {}
  })
};

final List<Color> colors = [
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.purple,
  Colors.blue,
  Colors.cyan,
  Colors.indigo,
  Colors.orange,
  Colors.amber,
  Colors.lime,
  Colors.pink,
  Colors.teal,
];

const InputDecorationTheme kInputDecorationTheme = InputDecorationTheme(
  focusColor: const Color(0xFFF6A00C),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      // ignore: deprecated_member_use
      color: const Color(0xFFF6A00C),
    ),
  ),
  hintStyle: TextStyle(
    color: Color(0xFF818991),
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0,
  ),
);

final TextTheme kTextTheme = TextTheme(
  headline2: GoogleFonts.inter(
    color: Colors.white,
    fontSize: 24.0,
    fontWeight: FontWeight.w500,
  ),
  headline4: TextStyle(
    fontSize: 12.0,
    color: Colors.grey[300],
    fontWeight: FontWeight.w500,
    letterSpacing: 2.0,
  ),
  bodyText1: TextStyle(
    color: Colors.grey[300],
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.0,
  ),
  bodyText2: TextStyle(
    color: Colors.grey[300],
    letterSpacing: 1.0,
  ),
);

final kDarkThemeData = ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  scaffoldBackgroundColor: const Color(0xFF121212),
  backgroundColor: const Color(0xFF121212),
  primaryColor: Color(0xFF121212),
  // ignore: deprecated_member_use
  accentColor: const Color(0xFFF6A00C),
  iconTheme: const IconThemeData().copyWith(color: Colors.white),
  fontFamily: 'Montserrat',
  inputDecorationTheme: kInputDecorationTheme,
  textTheme: kTextTheme,
);
