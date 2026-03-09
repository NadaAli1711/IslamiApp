import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islami_app/ui/screens/details_screen.dart';
import 'package:islami_app/ui/screens/home_screen.dart';

import 'core/utils/app_colors.dart';
import 'core/utils/route_name.dart';

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
      initialRoute: RouteName.homeScreen,
      routes: {
        RouteName.detailsScreen: (context) => DetailsScreen(),
        RouteName.homeScreen: (context) => HomeScreen(),
      },
      theme: ThemeData(
        fontFamily: 'JannaLTBold',
        scaffoldBackgroundColor: AppColors.transparent,
      ),
    );
  }
}