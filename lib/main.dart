import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islami_app/ui/screens/home_screen.dart';
import 'package:islami_app/ui/screens/on_boarding_screen.dart';
import 'package:islami_app/ui/tabs/hadith/hadith_details.dart';
import 'package:islami_app/ui/tabs/quran/quran_details.dart';

import 'core/utils/app_colors.dart';
import 'core/utils/route_name.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.homeScreen,
      routes: {
        RouteName.quranDetailsScreen: (context) => QuranDetails(),
        RouteName.hadithDetailsScreen: (context) => HadithDetails(),
        RouteName.homeScreen: (context) => HomeScreen(),
        RouteName.onBoardingScreen: (context) => OnBoardingScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Janna LT Bold',
        scaffoldBackgroundColor: AppColors.transparent,
      ),
    );
  }
}