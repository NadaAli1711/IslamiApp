import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/ui/tabs/quran/quran_lists.dart';

import '../../../core/utils/size_config.dart';
import '../../widgets/golden_back_button.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<QuranDetails> {
  String suraContent = '';
  List<String> suraVerses = [];

  int currentIndex = 0;
  bool isSwitched = false;
  int? selectedIndex;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final index = ModalRoute.of(context)?.settings.arguments as int;
    currentIndex = index;
    loadFileData('assets/suras/${index + 1}.txt');
  }

  @override
  Widget build(BuildContext context) {
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
                  GoldenBackButton(),
                  Expanded(
                    child: Text(
                      QuranLists.englishQuranSurahs[currentIndex],
                      style: AppStyles.gold20Bold,
                      textAlign: .center,
                    ),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                    activeTrackColor: AppColors.gold,
                    activeThumbColor: AppColors.white,
                    inactiveTrackColor: AppColors.white,
                    inactiveThumbColor: AppColors.gold,
                  ),
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
                  Text(
                    QuranLists.arabicAuranSuras[currentIndex],
                    style: AppStyles.gold20Bold,
                  ),
                  Image.asset(AppImages.rightCorner),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: isSwitched
                    ? SingleChildScrollView(
                        child: Expanded(
                          child: Text(
                            suraContent,
                            style: AppStyles.gold20Bold,
                            textAlign: .center,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => setState(() {
                            selectedIndex = index;
                          }),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? AppColors.gold
                                  : AppColors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              border: BoxBorder.all(color: AppColors.gold),
                            ),
                            child: Text(
                              suraVerses[index],
                              style: selectedIndex == index
                                  ? AppStyles.black20Bold
                                  : AppStyles.gold20Bold,
                              textAlign: .center,
                            ),
                          ),
                        ),
                        itemCount: suraVerses.length,
                      ),
              ),
            ),
            Image.asset(AppImages.bottomImg),
          ],
        ),
      ),
    );
  }

  Future<void> loadFileData(String path) async {
    String content = await rootBundle.loadString(path);
    List<String> verses = content.trim().split('\n');
    suraVerses = verses;
    for (int i = 0; i < suraVerses.length; i++) {
      suraContent += '[${i + 1}] ${suraVerses[i]}';
    }

    setState(() {});
  }
}
