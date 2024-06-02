import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:orell/config/app_config.dart';
import 'package:orell/presentation/home/controller/home_controller.dart';
import 'package:orell/widgets/centered_widget.dart';
import 'package:provider/provider.dart';

import '../../../widgets/title_and_textformfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();
  var studentNameController = TextEditingController();
  var emailController = TextEditingController();
  var addressController = TextEditingController();
  var whatsappNumberController = TextEditingController();
  var guardianNameController = TextEditingController();
  var contactNumberController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  String? passwordCheck;
  File? image;

  Future<void> getImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: CenteredView(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Academic Year",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Consumer<HomeController>(builder: (context, controller, _) {
                          return Container(
                            width: size.width * AppConfig.width,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  padding: const EdgeInsets.all(5),
                                  isExpanded: true,
                                  items: controller.dropdownItemsAcademicYear,
                                  onChanged: (selected) {}),
                            ),
                          );
                        }),
                        TitleAndTextFormField(
                          controller: studentNameController,
                          title: 'Student Name',
                          width: size.width * AppConfig.width,
                          fontColor: Colors.indigo.shade300,
                        ),
                        TitleAndTextFormField(
                          controller: emailController,
                          title: 'Email',
                          width: size.width * AppConfig.width,
                          fontColor: Colors.indigo.shade300,
                        ),
                        TitleAndTextFormField(
                          controller: addressController,
                          filled: true,
                          filledColor: Colors.indigo.shade50,
                          borderRadius: 5,
                          title: 'Address',
                          maxLines: 4,
                          width: size.width * AppConfig.width,
                          fontColor: Colors.black,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Class/Semester",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Consumer<HomeController>(builder: (context, controller, _) {
                          return Container(
                            width: size.width * AppConfig.width,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(5)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  padding: const EdgeInsets.all(5),
                                  isExpanded: true,
                                  items: controller.dropdownItemsClassSemester,
                                  onChanged: (selected) {}),
                            ),
                          );
                        }),
                        TitleAndTextFormField(
                          controller: whatsappNumberController,
                          filled: true,
                          filledColor: Colors.indigo.shade50,
                          title: 'Whatsapp Number',
                          width: size.width * AppConfig.width,
                          fontColor: Colors.black,
                        ),
                        Text("Image", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Container(
                          width: size.width * AppConfig.width,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle, border: Border.all(color: Colors.black)),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  getImage(ImageSource.gallery);
                                },
                                child: Container(
                                  height: 40,
                                  width: 100,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.rectangle, color: Colors.grey.shade200),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Choose file",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(image==null?"no file chosen":"${image?.path}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo.shade300))
                            ],
                          ),
                        ),
                        TitleAndTextFormField(
                          controller: guardianNameController,
                          filled: true,
                          filledColor: Colors.indigo.shade50,
                          title: 'Guardian Name',
                          width: size.width * AppConfig.width,
                          fontColor: Colors.black,
                        ),
                        TitleAndTextFormField(
                          controller: contactNumberController,
                          title: 'Contact Number',
                          width: size.width * AppConfig.width,
                          fontColor: Colors.indigo.shade300,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(color: Colors.pink.shade100),
                  alignment: Alignment.center,
                  child: Text("Student Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleAndTextFormField(
                      controller: userNameController,
                      title: 'Username',
                      width: size.width * AppConfig.width1,
                      fontColor: Colors.indigo.shade300,
                    ),
                    TitleAndTextFormField(
                        controller: passwordController,
                        title: 'Password',
                        obscureText: true,
                        width: size.width * AppConfig.width1,
                        fontColor: Colors.indigo.shade300,
                        validator: (enteredPassword) {
                          passwordCheck = enteredPassword;
                          return null;
                        }),
                    TitleAndTextFormField(
                        controller: confirmPasswordController,
                        title: 'Confirm Password',
                        obscureText: true,
                        width: size.width * AppConfig.width1,
                        fontColor: Colors.indigo.shade300,
                        validator: (confirmPassword) {
                          if (confirmPassword != passwordCheck) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text("Password Mismatch"), backgroundColor: Colors.redAccent));
                          }
                          return null;
                        }),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    var valid = formKey.currentState!.validate();
                  },
                  child: Container(
                    height: 60,
                    width: 80,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.deepPurple),
                    alignment: Alignment.center,
                    child: Text("Submit", style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
