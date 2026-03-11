import 'package:flutter/material.dart';

import '../../../core/utils/app_asset.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class MostRecent extends StatelessWidget {
  const MostRecent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 17),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text('Al-Anbiya', style: AppStyles.black24Bold),
                Text('الأنبياء', style: AppStyles.black24Bold),
                Text('112 Verses  ', style: AppStyles.black14Bold),
              ],
            ),
            Image.asset(AppImages.mostRecentImg),
          ],
        ),
      ),
      separatorBuilder: (context, index) => SizedBox(width: 10),
      itemCount: 10,
    );
  }
}
