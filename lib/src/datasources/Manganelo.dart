import 'dart:convert';

import 'package:profoundgodlibrary/src/database/schema/chapter.dart';
import 'package:profoundgodlibrary/src/database/schema/readable.dart';
import 'package:profoundgodlibrary/src/datasources/datasources.dart';
import 'package:http/http.dart';

class Manganelo extends DataSource {
  Manganelo() : super('Manganelo');

  @override
  String searchLink = '';

  @override
  Future<List<Readable>> search(String searchTerm) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = Request(
        'GET',
        Uri.parse(
            'http://localhost:5001/profound-god-library-9dc0b/us-central1/search')); // TODO: Change the link in production
    request.bodyFields = {
      'term': searchTerm,
      'source': dataSourceID.toLowerCase()
    };
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return <Readable>[
        for (dynamic r in jsonDecode(await response.stream.bytesToString()))
          Readable.fronServer(r)
      ];
    } else {
      print(jsonDecode(await response.stream.bytesToString())['message']);
      return [];
    }
  }

  @override
  Future<ReadableDetails?> details(String link) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = Request(
        'GET',
        Uri.parse(
            'http://localhost:5001/profound-god-library-9dc0b/us-central1/details')); // TODO: Change the link in production
    request.bodyFields = {'link': link, 'source': dataSourceID.toLowerCase()};
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return ReadableDetails.fromServer(
          jsonDecode(await response.stream.bytesToString()));
    } else {
      print(jsonDecode(await response.stream.bytesToString())['message']);
    }
  }

  @override
  Future<List<ChapterUnit>> getChapter(String link) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = Request(
        'GET',
        Uri.parse(
            'http://localhost:5001/profound-god-library-9dc0b/us-central1/getChapter')); // TODO: Change the link in production

    request.bodyFields = {'link': link, 'source': dataSourceID.toLowerCase()};
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return <ChapterUnit>[
        for (dynamic r in jsonDecode(await response.stream.bytesToString()))
          ChapterUnit.fromJson(r)
      ];
    } else {
      print(jsonDecode(await response.stream.bytesToString())['message']);
      return [];
    }
  }
}
