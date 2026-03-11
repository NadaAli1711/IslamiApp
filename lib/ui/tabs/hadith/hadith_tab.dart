import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/route_name.dart';

import '../../../core/utils/size_config.dart';
import '../../widgets/details_content.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<String> allHadithList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithContent();
  }

  final List<int> hadithIndexList = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return (allHadithList.isEmpty)
        ? Center(child: CircularProgressIndicator(color: AppColors.gold))
        : CarouselSlider(
            items: hadithIndexList.map((i) {
              int firstNewLine = allHadithList[i].indexOf('\n');
              String hadithTitle = allHadithList[i].substring(0, firstNewLine);
              String hadithContent = allHadithList[i].substring(
                firstNewLine + 1,
              );
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      RouteName.hadithDetailsScreen,
                      arguments: [
                        'Hadith ${i + 1}',
                        hadithTitle,
                        hadithContent,
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: ContextSize.heightPercentage(50),
                          bottom: ContextSize.heightPercentage(80)),
                      width: ContextSize.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.hadithCard),
                        ),
                      ),
                      child: Column(
                        spacing: ContextSize.heightPercentage(10),
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: ContextSize.widthPercentage(20),),
                              child: Text(
                                hadithTitle,
                                style: AppStyles.black24Bold,
                                textAlign: .center,
                              ),
                            ),
                          ),
                          DetailsContent(
                            content: hadithContent,
                            flex: 5,
                            textStyle: AppStyles.black16Bold,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: ContextSize.heightPercentage(618),
              aspectRatio: 16 / 9,
              viewportFraction: 0.7,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          );
  }

  Future<void> loadHadithContent() async {
    for (int index = 1; index <= 50; index++) {
      String hadith = await rootBundle.loadString('assets/Hadith/h$index.txt');
      allHadithList.add(hadith);
    }
    setState(() {});
  }
}
