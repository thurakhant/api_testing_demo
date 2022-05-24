import 'package:apitest/example_four.dart';
import 'package:apitest/example_three.dart';
import 'package:apitest/example_two.dart';
import 'package:apitest/home_screen.dart';
import 'package:apitest/signup.dart';
import 'package:apitest/upload_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UploadImageScreen(),
    );
  }
}
