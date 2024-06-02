import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  static getData({
    required String baseUrl,
    Map<String, String>? header,
  }) async {
    log("ApiHelper -> getData()");
    final url = Uri.parse(baseUrl);
    log("url -> $url");
    try {
      var response = await http.get(url, headers: header);
      log("getData -> Status code -> ${response.statusCode}");
      log("response -> ${response.body.toString()}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        return decodedData;
      } else {
        log("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }

  static postData({
    required String baseUrl,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    log("ApiHelper -> postData()");
    log("body -> $body");
    final url = Uri.parse(baseUrl);
    log("url -> $url");
    try {
      var response = await http.post(url, body: body);
      log("Api Called -> status code -> ${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var data = {"status": 1, "data": decodedData};
        return decodedData;
      } else {
        log("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        return decodedData;
      }
    } catch (e) {
      log("$e");
    }
  }
}
