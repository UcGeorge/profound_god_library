// // import 'dart:html';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'Novel.dart';
// import 'dart:convert'; // Contains the JSON encoder
// import 'package:http/http.dart'; // Contains a client for making API calls
// import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
// import 'package:html/dom.dart'; // Contains DOM related classes for extracting data from elements

// class WuxiaWorld extends ChangeNotifier {
//   final Uri homePage = Uri.parse("https://www.wuxiaworld.com");

//   /*Future<List<Novel>> getHomepage() async 
//   {
//     print("Getting Wuxia world homepage");
//     var client = Client();
//     Response response = await client.get(homePage);
//     // print(response.body);

//     var document = parse(response.body);
//     var novelItems =
//         document.querySelectorAll('div.novel-item div.novel-title a');
//     print(novelItems.length > 0
//         ? novelItems.length.toString() + " | " + novelItems[0].text
//         : "Homepage is empty...");

//     var file = await File(r'C:\Users\Public\Documents\PGL\webtest.html')
//         .writeAsString(response.body);

//     return [];
//   }
//   */

// }
