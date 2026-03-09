import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_asset.dart';

import '../../../core/utils/app_styles.dart';

class SebhaTab extends StatefulWidget {

  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 33;
  double turns = 0.0;

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
            Transform.rotate(
              angle: turns,
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.sebha,
                height: 380,
                width: 380,
                fit: BoxFit.contain,
              ),
            ),
            GestureDetector(
              onTap: () {
                turns += 6 / 32;
                if (counter == 0) {
                  counter = 33;
                } else {
                  counter--;
                }
                setState(() {

                });
              },
              child: Column(
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
            ),
          ],
        ),
      ],
    );
  }
}