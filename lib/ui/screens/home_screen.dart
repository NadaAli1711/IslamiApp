import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';

import '../../core/utils/app_asset.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.quranBg),
        SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.gold,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(AppImages.iconQuran),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppImages.iconHadeth),
                  label: 'Hadith',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppImages.iconSebha),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppImages.iconRadio),
                  label: 'Radio',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppImages.iconTime),
                  label: 'Time',
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Image.asset(
                    AppImages.headerIslamiImg,
                    width: double.infinity,
                  ),
                  TextField(
                    style: AppStyles.white16Bold,
                    cursorColor: AppColors.gold,
                    decoration: InputDecoration(
                      border: buildBorder(),
                      enabledBorder: buildBorder(),
                      focusedBorder: buildBorder(),
                      prefixIcon: Image.asset(AppImages.quranIcon),
                      hintText: 'Sura Name',
                      hintStyle: AppStyles.white16Bold,
                    ),
                  ),
                  Text('Most Recently', style: AppStyles.white16Bold),
                  SizedBox(
                    height: 150,

                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 17,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text('Al-Anbiya', style: AppStyles.black24Bold),
                                Text('الأنبياء', style: AppStyles.black24Bold),
                                Text(
                                  '112 Verses  ',
                                  style: AppStyles.black14Bold,
                                ),
                              ],
                            ),
                            Image.asset(AppImages.mostRecentImg),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemCount: 114,
                    ),
                  ),
                  Text('Suras List', style: AppStyles.white16Bold),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => Row(
                        spacing: 24,
                        children: [
                          Stack(
                            alignment: .center,
                            children: [
                              Image.asset(AppImages.frameImg),
                              Text('1', style: AppStyles.white20Bold),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: .start,
                              children: [
                                Text('aaaaaaa', style: AppStyles.white20Bold),
                                Text('aaaa', style: AppStyles.white20Bold),
                              ],
                            ),
                          ),
                          Text('data', style: AppStyles.white20Bold),
                        ],
                      ),
                      separatorBuilder: (context, index) =>
                          Divider(color: AppColors.white, height: 2),
                      itemCount: 114,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
