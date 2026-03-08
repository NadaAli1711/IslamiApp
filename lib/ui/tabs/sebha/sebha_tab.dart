import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';

import '../../../core/utils/app_styles.dart';

class SebhaTab extends StatelessWidget {
  final int counter = 30;
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            style: AppStyles.white36Bold,
            textAlign: TextAlign.center,
          ),
        ),

        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              AppImages.sebha,
            ),
            Column(
              children: [
                const SizedBox(height: 80,),
                Text(
                  'سبحان الله',
                  style: AppStyles.white36Bold,
                ),
                Text(
                  '$counter',
                  style: AppStyles.white36Bold,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}