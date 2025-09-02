import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/app_theme.dart';

class CustomUserDataRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const CustomUserDataRow({
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          Icon(icon, size: 16.sp),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyles.regular14W400(context),
          ),
        ],
      ),
    );
  }
}
