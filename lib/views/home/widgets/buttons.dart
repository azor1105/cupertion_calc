import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubits/calc/calc_cubit.dart';
import '../../../utils/my_colors.dart';
import 'circle_button.dart';

class CalcButtons extends StatelessWidget {
  const CalcButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 18.h,
      ),
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        CircleButton(
          title: "AC",
          onTap: () => context.read<CalcCubit>().acClear(),
        ),
        CircleButton(
          title: "÷",
          onTap: () => context.read<CalcCubit>().addCharacter("÷"),
        ),
        CircleButton(
          title: "%",
          onTap: () => context.read<CalcCubit>().addCharacter("%"),
        ),
        CircleButton(
          title: "<",
          onTap: () => context.read<CalcCubit>().removeLastCharacter(),
          color: MyColors.cFF9500,
        ),
        CircleButton(
          title: "7",
          onTap: () => context.read<CalcCubit>().addCharacter("7"),
        ),
        CircleButton(
          title: "8",
          onTap: () => context.read<CalcCubit>().addCharacter("8"),
        ),
        CircleButton(
          title: "9",
          onTap: () => context.read<CalcCubit>().addCharacter("9"),
        ),
        CircleButton(
          title: "x",
          onTap: () => context.read<CalcCubit>().addCharacter("x"),
          color: MyColors.cFF9500,
        ),
        CircleButton(
          title: "4",
          onTap: () => context.read<CalcCubit>().addCharacter("4"),
        ),
        CircleButton(
          title: "5",
          onTap: () => context.read<CalcCubit>().addCharacter("5"),
        ),
        CircleButton(
          title: "6",
          onTap: () => context.read<CalcCubit>().addCharacter("6"),
        ),
        CircleButton(
          title: "-",
          onTap: () => context.read<CalcCubit>().addCharacter("-"),
          color: MyColors.cFF9500,
        ),
        CircleButton(
          title: "1",
          onTap: () => context.read<CalcCubit>().addCharacter("1"),
        ),
        CircleButton(
          title: "2",
          onTap: () => context.read<CalcCubit>().addCharacter("2"),
        ),
        CircleButton(
          title: "3",
          onTap: () => context.read<CalcCubit>().addCharacter("3"),
        ),
        CircleButton(
          title: "+",
          onTap: () => context.read<CalcCubit>().addCharacter("+"),
          color: MyColors.cFF9500,
        ),
      ],
    );
  }
}
