import 'package:orell/repository/helper/api_helper.dart';

class HomeService {
  static Future<dynamic> fetchAcademicYear() async {
    print("HomeService -> fetchAcademicYear()");
    try {
      var decodedData = await ApiHelper.getData(
        baseUrl: "https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32",
      );
      return decodedData;
    } catch (e) {
      print("error -> HomeService -> fetchAcademicYear ->  $e");
    }
  }

  static Future<dynamic> onSave(data) async {
    try {
      var decodedData = ApiHelper.postData(
        baseUrl: "https://llabdemo.orell.com/api/userService/anonymous/saveUser",
        body: data,
        header: {
          'Content-Type': 'application/json',
        }
      );
      return decodedData;
    } catch (e) {
      print("$e");
    }
  }
}
