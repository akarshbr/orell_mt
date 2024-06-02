import 'package:flutter/material.dart';
import 'package:orell/presentation/home/controller/home_controller.dart';
import 'package:orell/presentation/home/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeController())],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
