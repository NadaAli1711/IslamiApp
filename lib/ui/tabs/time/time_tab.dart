import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';
import 'package:islami_app/core/utils/app_styles.dart';

import '../../../core/utils/size_config.dart';
import '../../widgets/azkar_card.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: .start,
      children: [
        Container(
          height: ContextSize.heightPercentage(301),
          width: ContextSize.widthPercentage(390),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.prayTimeBg),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Row(children: [Text('16 Jul,\n2024')]),
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
