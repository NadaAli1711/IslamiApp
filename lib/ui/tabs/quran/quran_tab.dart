import 'package:flutter/material.dart';

import '../../../core/utils/app_asset.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_config.dart';
import 'most_recent.dart';
import 'vertical_view_list.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: ContextSize.heightPercentage(20),
      children: [
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
            height: ContextSize.heightPercentage(150), child: MostRecent()),
        Text('Suras List', style: AppStyles.white16Bold),
        VerticalViewList(),
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
