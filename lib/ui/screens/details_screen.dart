import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/ui/tabs/quran/quran_lists.dart';

import '../../core/utils/size_config.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final index = ModalRoute
        .of(context)
        ?.settings
        .arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Column(
          spacing: 20,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ContextSize.widthPercentage(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_rounded),
                    color: AppColors.gold,
                    style: IconButton.styleFrom(
                        iconSize: 30
                    ),
                  ),
                  Expanded(child: Text(QuranLists.englishQuranSurahs[index],
                    style: AppStyles.gold20Bold,
                    textAlign: .center,)),
                  SizedBox(width: 30,)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ContextSize.widthPercentage(10),
              ),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Image.asset(AppImages.leftCorner),
                  Text(QuranLists.arabicAuranSuras[index],
                      style: AppStyles.gold20Bold),
                  Image.asset(AppImages.rightCorner),
                ],
              ),
            ),
            Expanded(child: Container(color: AppColors.gold)),
            Image.asset(AppImages.bottomImg),
          ],
        ),
      ),
    );
  }
}
