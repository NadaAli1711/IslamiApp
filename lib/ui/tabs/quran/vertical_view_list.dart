import 'package:flutter/material.dart';

import '../../../core/utils/app_asset.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/route_name.dart';
import '../../../core/utils/size_config.dart';
import 'quran_lists.dart';

class VerticalViewList extends StatelessWidget {
  const VerticalViewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.of(
            context,
          ).pushNamed(RouteName.quranDetailsScreen, arguments: index),
          child: Row(
            spacing: ContextSize.widthPercentage(24),
            children: [
              Stack(
                alignment: .center,
                children: [
                  Image.asset(AppImages.frameImg),
                  Text('${index + 1}', style: AppStyles.pureWhite20Bold),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: ContextSize.heightPercentage(5),
                  children: [
                    Text(
                      QuranLists.englishQuranSurahs[index],
                      style: AppStyles.pureWhite20Bold,
                    ),
                    Text(
                      '${QuranLists.AyaNumber[index]} Verses',
                      style: AppStyles.pureWhite14Bold,
                    ),
                  ],
                ),
              ),
              Text(
                QuranLists.arabicAuranSuras[index],
                style: AppStyles.pureWhite20Bold,
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
              vertical: ContextSize.heightPercentage(10)),
          child: Divider(color: AppColors.white),
        ),
        itemCount: 114,
      ),
    );
  }
}
