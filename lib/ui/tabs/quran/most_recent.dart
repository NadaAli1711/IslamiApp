import 'package:flutter/material.dart';
import 'package:islami_app/ui/tabs/quran/quran_lists.dart';

import '../../../core/utils/app_asset.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_config.dart';

class MostRecent extends StatelessWidget {
  final List<int> mostRecentList;

  const MostRecent({super.key, required this.mostRecentList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: ContextSize.heightPercentage(20),
      children: [
        Text('Most Recently', style: AppStyles.white16Bold),
        SizedBox(
          height: ContextSize.heightPercentage(150),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              int currentIndex = mostRecentList[index];
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: ContextSize.heightPercentage(12),
                  horizontal: ContextSize.widthPercentage(17),
                ),
                decoration: BoxDecoration(
                  color: AppColors.gold,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(QuranLists.englishQuranSurahs[currentIndex],
                            style: AppStyles.black24Bold),
                        Text(QuranLists.arabicQuranSuras[currentIndex],
                            style: AppStyles.black24Bold),
                        Text('${QuranLists.AyaNumber[currentIndex]} Verses  ',
                            style: AppStyles.black14Bold),
                      ],
                    ),
                    Image.asset(AppImages.mostRecentImg),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(width: ContextSize.widthPercentage(10)),
            itemCount: mostRecentList.length,
          ),
        ),
      ],
    );
  }
}
