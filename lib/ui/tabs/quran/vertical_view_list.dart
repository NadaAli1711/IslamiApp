import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/most_recent_provider.dart';
import '../../../core/utils/app_asset.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/route_name.dart';
import '../../../core/utils/size_config.dart';
import 'quran_lists.dart';

class VerticalViewList extends StatelessWidget {
  final List<int> filterList;

  const VerticalViewList({super.key, required this.filterList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          int suraIndex = filterList[index];
          return InkWell(

            onTap: () {
              Provider
                  .of<MostRecentProvider>(context, listen: false)
                  .addMostRecentSura(suraIndex);
                Navigator.of(
                  context,
                ).pushNamed(RouteName.quranDetailsScreen, arguments: suraIndex);
            },
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
                        QuranLists.englishQuranSurahs[suraIndex],
                        style: AppStyles.pureWhite20Bold,
                      ),
                      Text(
                        '${QuranLists.AyaNumber[suraIndex]} Verses',
                        style: AppStyles.pureWhite14Bold,
                      ),
                    ],
                  ),
                ),
                Text(
                  QuranLists.arabicQuranSuras[suraIndex],
                  style: AppStyles.pureWhite20Bold,
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
              vertical: ContextSize.heightPercentage(10)),
          child: Divider(color: AppColors.white),
        ),
        itemCount: filterList.length,
      ),
    );
  }
}
