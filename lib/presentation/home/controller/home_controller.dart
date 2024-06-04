import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:orell/config/app_config.dart';
import 'package:orell/repository/api/model/academic_year_model.dart';
import 'package:orell/repository/api/service/home_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  String? academicYearSelected;
  String? classSemesterSelected;
  AcademicYearModel academicYearModel = AcademicYearModel();
  var getData;
  var classId;

  fetchAcademicYear() {
    print("HomeController -> fetchAcademicYear()");
    HomeService.fetchAcademicYear().then((value) {
      if (value["status"] == 1) {
        academicYearModel = AcademicYearModel.fromJson(value);
      } else {
        print("error");
      }
      notifyListeners();
    });
  }

  onSave(
    BuildContext context,
    File? selectedImage,
     studentName,
     username,
     contactNumber,
     address,
     email,
     whatsappNumber,
     password,
  ) {
    print("HomeController -> onSave()");
    var data = {
      "userId": "0",
      "institutionId": "32",
      "name": "$studentName",
      "userCode": "$username.orell1",
      "address": "$address",
      "emailId": "$email",
      "mobileCode": " ",
      "whatsappCode": " ",
      "mobileNo": "$contactNumber",
      "whatsappNo": "$whatsappNumber",
      "image": "",
      "password": "$password",
      "userType": "STUDENT",
      "academicYearId": "$academicYearSelected",
      "createdBy": " ",
      "modifiedBy": " ",
      "userClassDetailsList": [
        {"userClassId": 0, "userId": "0", "classId": "$classSemesterSelected"}
      ],
      "areaofintrest": "Test Orell"
    };
    HomeService.onSave(data).then((onValue){
      if(onValue["status"]==1){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered")));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed")));
      }
    });
  }

  Future<void> onRegister(
    BuildContext context,
    File? selectedImage,
    String studentName,
    String username,
    String contactNumber,
    String address,
    String email,
    String whatsappNumber,
    String password,
  ) async {
    try {
      var url = "https://llabdemo.orell.com/api/userService/anonymous/saveUser";
      onUploadImage(
        url,
        selectedImage,
        studentName,
        username,
        contactNumber,
        address,
        email,
        whatsappNumber,
        password,
        academicYearSelected!,
        classSemesterSelected!,
      ).then((value) {
        if (value.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("failed")));
        }
      });
    } catch (e) {
      print("$e");
    }
  }

  Future<http.Response> onUploadImage(
    String url,
    File? selectedImage,
    String studentName,
    String username,
    String contactNumber,
    String address,
    String email,
    String whatsappNumber,
    String password,
    String academicYearSelected,
    String classSemesterSelected,
  ) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    if (selectedImage != null) {
      print("image size -> ${selectedImage.lengthSync()} B");
      request.files.add(await http.MultipartFile.fromPath('image', selectedImage.path));
    }
    request.fields["userId"] = "0";
    request.fields["institutionId"] = "32";
    request.fields["name"] = studentName;
    request.fields["userCode"] = "$username.orell1";
    request.fields["address"] = address;
    request.fields["emailId"] = email;
    request.fields["mobileCode"] = "";
    request.fields["whatsappCode"] = "";
    request.fields["mobileNo"] = contactNumber;
    request.fields["whatsappNo"] = whatsappNumber;
    request.fields["password"] = password;
    request.fields["userType"] = "STUDENT";
    request.fields["academicYearId"] = academicYearSelected;
    request.fields["createdBy"] = "";
    request.fields["modifiedBy"] = "";
    request.fields["userClassDetailsList"] = [
      {
        request.fields["userClassId"] = "0",
        request.fields["userId"] = "0",
        request.fields["classId"] = classSemesterSelected
      }
    ].toString();
    request.fields["areaofintrest"] = "Test Orell";
    request.headers.addAll(headers);
    print("request: $request");
    var res = await request.send();
    return await http.Response.fromStream(res);
  }

  void setAcademicYear(String selectedAcademicYear) {
    academicYearSelected = selectedAcademicYear;
    notifyListeners();
  }

  void setClassSemester(String selectedClassSemester) {
    classSemesterSelected = selectedClassSemester;
    notifyListeners();
  }

  List<DropdownMenuItem<String>> get dropdownItemsAcademicYear {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "93", child: Text("2021-2022")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsClassSemester {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "772", child: Text("CLASS 1")),
      DropdownMenuItem(value: "17529", child: Text("Class 4")),
      DropdownMenuItem(value: "18871", child: Text("Class 5")),
      DropdownMenuItem(value: "793", child: Text("+2")),
      DropdownMenuItem(value: "17969", child: Text("MCA 1")),
    ];
    return menuItems;
  }




}
