import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class MoreServiceComponent extends StatelessWidget {
  final int? length;
  const MoreServiceComponent({super.key, this.length});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppColors.backgroundYellow.withOpacity(0.10), borderRadius: BorderRadius.circular(8), border: Border.all(width: 0.9, color: AppColors.backgroundYellow)),
      child: Text(
        "+${length ?? 0} more",
        style: TextStyle(color: AppColors.backgroundYellow),
      ),
    );
  }
}
