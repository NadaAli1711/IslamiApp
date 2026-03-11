import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/core/utils/size_config.dart';

class TimeCarouselSlider extends StatelessWidget {
  final List<Map<String, String>> prayerData = [
    {'name': 'Fajr', 'time': '04:42', 'period': 'AM'},
    {'name': 'Dhuhr', 'time': '12:05', 'period': 'PM'},
    {'name': 'Asr', 'time': '03:31', 'period': 'PM'},
    {'name': 'Maghrib', 'time': '06:04', 'period': 'PM'},
    {'name': 'Isha', 'time': '07:22', 'period': 'PM'},
  ];
  TimeCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: ContextSize.heightPercentage(128),
        aspectRatio: 16 / 9,
        viewportFraction: 0.3,
        initialPage: 2,
        enlargeCenterPage: true,
        enlargeFactor: 0.25,
        scrollDirection: Axis.horizontal,
        enableInfiniteScroll: false,
      ),
      items: prayerData.map((prayer) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: ContextSize.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [AppColors.black, AppColors.gradientGold],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Text(prayer['name']!, style: AppStyles.pureWhite14Bold),
                  Text(prayer['time']!, style: AppStyles.pureWhite24Bold),
                  Text(prayer['period']!, style: AppStyles.pureWhite14Bold),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
