import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islami_app/ui/screens/details_screen.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailsScreen(),
    );
  }
}