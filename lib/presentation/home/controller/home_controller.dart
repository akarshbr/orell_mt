import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier{
  List<DropdownMenuItem<String>> get dropdownItemsAcademicYear {
    List<DropdownMenuItem<String>> menuItems = List.generate(9, (index){
      return DropdownMenuItem(value: "202$index - 202${index+1}",child: Text("202$index - 202${index+1}"));
    });
    return menuItems;
  }
  List<DropdownMenuItem<String>> get dropdownItemsClassSemester {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "Science",child: Text("Science")),
      DropdownMenuItem(value: "Science",child: Text("Maths")),
      DropdownMenuItem(value: "Science",child: Text("English")),
      DropdownMenuItem(value: "Science",child: Text("Social Science")),
    ];
    return menuItems;
  }

}