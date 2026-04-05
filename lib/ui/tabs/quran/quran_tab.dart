import 'package:flutter/material.dart';
import 'package:islami_app/ui/tabs/quran/quran_lists.dart';

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
  List<int> filterList = List.generate(114, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: ContextSize.heightPercentage(20),
      children: [
        TextField(
          onChanged: (text) => search(text),
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
          height: ContextSize.heightPercentage(150),
          child: MostRecent(),
        ),
        Text('Suras List', style: AppStyles.white16Bold),
        VerticalViewList(filterList: filterList),
      ],
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.gold),
      borderRadius: BorderRadius.circular(10),
    );
  }

  bool isValidEnglishText(String text) {
    final RegExp englishRegex = RegExp(r"^[a-zA-Z\s'-]+$");
    return englishRegex.hasMatch(text);
  }

  void search(String text) {
    List<int> tempList = [];

    if (isValidEnglishText(text)) {
      for (int i = 0; i < 114; i++) {
        if (QuranLists.englishQuranSurahs[i].toUpperCase().contains(
          text.toUpperCase(),
        )) {
          tempList.add(i);
        }
      }
    } else {
      for (int i = 0; i < 114; i++) {
        if (QuranLists.arabicAuranSuras[i].contains(text)) {
          tempList.add(i);
        }
      }
    }

    setState(() {
      filterList = tempList;
    });
  }
}
