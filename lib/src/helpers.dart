import 'dart:io';
import 'package:http/http.dart';

class Helper {
  static String getID(String origin) {
    String ac = 'abcdefghijklmnopqrstuvwxyz';
    StringBuffer stringBuffer = StringBuffer();

    for (int i = 0; i < origin.length; i++) {
      var s = origin.toLowerCase()[i];
      if (ac.contains(s)) stringBuffer.write(s);
    }

    return stringBuffer.toString();
  }

  static List<T> sort<T>(List<T> data, bool compare(T v1, T v2)) {
    //! print('sorting $data');
    List<T> result = data;
    for (int i = 0; i < result.length; i++) {
      T _min = result[i];
      int _minIndex = i;
      for (int j = i + 1; j < result.length; j++) {
        if (compare(result[j], _min)) {
          _min = result[j];
          _minIndex = j;
        }
      }
      result.insert(i, _min);
      result.removeAt(_minIndex);
    }
    return result;
  }

  static downloadImage(Uri url, String filePath, String fileName,
      {String? referer}) async {
    Map<String, String> headers = referer == null ? {} : {'referer': referer};
    print('[INFO] Sending request: ${url.toString()}');
    var response = await get(url, headers: headers); // * <--2
    print('[INFO] Gotten response, writing to file: ${filePath + fileName}');
    File file2 = new File(filePath + fileName); // * <-- 2
    file2.writeAsBytesSync(response.bodyBytes); // * <-- 3
    print('[INFO] Done writing to file');
    print('[INFO] Finished download');
  }
}
