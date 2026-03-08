import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/ui/tabs/time/time_tab.dart';

import '../../core/utils/app_asset.dart';
import '../tabs/hadith/hadith_tab.dart';
import '../tabs/quran/quran_tab.dart';
import '../tabs/radio/radio_tab.dart';
import '../tabs/sebha/sebha_tab.dart';
import '../widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabsList = [
    QuranTab(), HadithTab(), SebhaTab(), RadioTab(), TimeTab()
  ];
  List<String> bgList = [
    AppImages.quranBg,
    AppImages.hadithBg,
    AppImages.sebhaBg,
    AppImages.radioBg,
    AppImages.timeBg,

  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(bgList[currentIndex]),
        SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            bottomNavigationBar: BottomBar(
              currentIndex: currentIndex, onTap: (index) =>
                setState(() {
                  currentIndex = index;
                }),),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    AppImages.headerIslamiImg,
                    width: double.infinity,
                  ),
                  Expanded(child: tabsList[currentIndex]),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }


}
