import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class GoldenBackButton extends StatelessWidget {
  const GoldenBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(Icons.arrow_back_rounded),
      color: AppColors.gold,
      style: IconButton.styleFrom(iconSize: 30),
    );
  }
}
