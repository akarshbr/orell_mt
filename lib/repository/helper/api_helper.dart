import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  static getData({
    required String baseUrl,
    Map<String, String>? header,
  }) async {
    print("ApiHelper -> getData()");
    final url = Uri.parse(baseUrl);
    print("url -> $url");
    try {
      var response = await http.get(url, headers: header);
      print("getData -> Status code -> ${response.statusCode}");
      print("response -> ${response.body.toString()}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var data = {"status": 1, "data": decodedData};
        return data;
      } else {
        print("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        return decodedData;
      }
    } catch (e) {
      print("error -> ApiHelper -> getData -> $e");
    }
  }

  static postData({
    required String baseUrl,
    Map<String, String>? header,
    required Map<String, dynamic> body,
  }) async {
    print("ApiHelper -> postData()");
    print("body -> ${jsonEncode(body)}");
    final url = Uri.parse(baseUrl);
    print("url -> $url");
    try {
      var response = await http.post(url, body: jsonEncode(body),headers: header);
      print("Api Called -> status code -> ${response.statusCode}");
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var data = {"status": 1, "data": decodedData};
        return data;
      } else {
        print("Else Condition -> Api failed");
        var decodedData = jsonDecode(response.body);
        var data = {"status": 0, "data": decodedData};
        print("$decodedData");
        return data;
      }
    } catch (e) {
      print("error -> ApiHelper -> postData -> $e");
    }
  }
}
