import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:islami_app/ui/tabs/time/time_carousel_slider.dart';

import '../../../core/utils/size_config.dart';
import 'azkar_card.dart';

class TimeTab extends StatefulWidget {
  const TimeTab({super.key});

  @override
  State<TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<TimeTab> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: .start,
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          height: ContextSize.heightPercentage(301),
          width: ContextSize.widthPercentage(390),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.prayTimeBg),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            spacing: 15,

            children: [
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  Text('16 Jul,\n2024', style: AppStyles.pureWhite16Bold),
                  Column(
                    children: [
                      Text('Pray Time', style: AppStyles.black70Opacity20Bold),
                      Text('Tuesday', style: AppStyles.black90Opacity20Bold),
                    ],
                  ),

                  Text(
                    '09 Muh,\n1446',
                    style: AppStyles.pureWhite16Bold,
                    textAlign: .end,
                  ),
                ],
              ),
              TimeCarouselSlider(),
              Row(
                mainAxisAlignment: .center,
                children: [
                  SizedBox(width: 100),
                  Text('Next Pray - ', style: AppStyles.black75Opacity16Bold),
                  Text('02:32', style: AppStyles.black16Bold),
                  SizedBox(width: 50),
                  IconButton(
                    onPressed: () {
                      isClicked = !isClicked;
                      setState(() {});
                    },
                    icon: Icon(
                      isClicked ? Icons.volume_off : Icons.volume_up,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text('Azkar', style: AppStyles.white16Bold),
        Expanded(
          child: Row(
            spacing: 20,
            children: [
              AzkarCard(
                text: 'Evening Azkar',
                imageName: AppImages.eveningAzkar,
              ),
              AzkarCard(
                text: 'Morning Azkar',
                imageName: AppImages.morningAzkar,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
