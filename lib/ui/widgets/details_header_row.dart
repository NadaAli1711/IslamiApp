import 'package:flutter/material.dart';

import '../../core/utils/app_styles.dart';
import '../../core/utils/size_config.dart';
import 'golden_back_button.dart';

class DetailsHeaderRow extends StatelessWidget {
  final String title;

  const DetailsHeaderRow({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ContextSize.widthPercentage(10),
      ),
      child: Row(
        children: [
          GoldenBackButton(),
          Expanded(
            child: Text(title, style: AppStyles.gold20Bold, textAlign: .center),
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
