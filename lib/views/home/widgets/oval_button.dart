import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';

class OvalButton extends StatelessWidget {
  const OvalButton({
    super.key,
    this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 85.h,
        width: 170.w,
        decoration: BoxDecoration(
            color: color ?? MyColors.c333333,
            borderRadius: BorderRadius.circular(150.r)),
        child: Center(
          child: Row(
            children: [
              SizedBox(width: 24.w),
              Text(
                title,
                style: MyFonts.w400.copyWith(
                  fontSize: 42.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final String title;
  final VoidCallback onTap;
  final Color? color;
}
