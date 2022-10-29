import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_colors.dart';
import '../../../utils/my_fonts.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      width: 85.w,
      child: FloatingActionButton(
        backgroundColor:color ?? MyColors.c333333,
        onPressed: onTap,
        child: Text(
          title,
          style: MyFonts.w400.copyWith(
            fontSize: 42.sp,
          ),
        ),
      ),
    );
  }

  final String title;
  final VoidCallback onTap;
  final Color? color;
}

// solar balls