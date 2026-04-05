import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/filter_provider.dart';
import '../../../core/providers/most_recent_provider.dart';
import '../../../core/utils/app_asset.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_config.dart';
import 'most_recent.dart';
import 'vertical_view_list.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    var filterProvider = Provider.of<FilterProvider>(context);
    var mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Column(
      crossAxisAlignment: .start,
      spacing: ContextSize.heightPercentage(20),
      children: [
        TextField(
          onChanged: (text) => filterProvider.search(text),
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

        Visibility(
          visible: mostRecentProvider.mostRecentList.isNotEmpty,
          child: MostRecent(),
        ),
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
