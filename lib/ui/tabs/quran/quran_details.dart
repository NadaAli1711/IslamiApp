import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/ui/tabs/quran/quran_details_list_view.dart';
import 'package:islami_app/ui/tabs/quran/quran_lists.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/sura_details_provider.dart';
import '../../../core/utils/size_config.dart';
import '../../widgets/details_content.dart';
import '../../widgets/details_header_row.dart';
import '../../widgets/details_title_row.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<QuranDetails> {
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    WidgetsFlutterBinding.ensureInitialized();
    final index = ModalRoute.of(context)?.settings.arguments as int;
    currentIndex = index;
    Provider.of<SuraDetailsProvider>(
      context,
      listen: false,
    ).loadFileData(index);
  }

  @override
  Widget build(BuildContext context) {
    var suraDetailsProvider = Provider.of<SuraDetailsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          spacing: ContextSize.height * 0.03,
          children: [
            DetailsHeaderRow(
              title: QuranLists.englishQuranSurahs[currentIndex],
              hasSwitch: true,
            ),
            DetailsTitleRow(title: QuranLists.arabicQuranSuras[currentIndex]),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ContextSize.width * 0.03,
                ),
                child: suraDetailsProvider.isSwitched
                    ? DetailsContent(content: suraDetailsProvider.suraContent)
                    : QuranDetailsListView(),
              ),
            ),
            Image.asset(AppImages.bottomImg),
          ],
        ),
      ),
    );
  }
}
