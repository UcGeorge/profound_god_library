import 'package:profoundgodlibrary/src/Readable.dart';

class StateData {
  List<Readable> recentSearches;
  List<Readable> recents;
  Map<String, List<Readable>> library;

  StateData({
    required this.recentSearches,
    required this.recents,
    required this.library,
  });

  StateData.fromJson(Map<String, dynamic> json)
      : recentSearches = (json['recentSearches'] as List)
            .map((e) => Readable.fromJson(e))
            .toList(),
        recents =
            (json['recents'] as List).map((e) => Readable.fromJson(e)).toList(),
        library = {
          'novel': (json['library']['novel'] as List)
              .map((e) => Readable.fromJson(e))
              .toList(),
          'manga': (json['library']['manga'] as List)
              .map((e) => Readable.fromJson(e))
              .toList(),
        };

  Map<String, dynamic> toJson() => {
        "recentSearches": recentSearches,
        "recents": recents,
        "library": library,
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
