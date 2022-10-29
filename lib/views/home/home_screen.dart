import 'package:cupertino_calc/cubits/calc/calc_cubit.dart';
import 'package:cupertino_calc/utils/my_colors.dart';
import 'package:cupertino_calc/utils/my_fonts.dart';
import 'package:cupertino_calc/utils/utility_functions.dart';
import 'package:cupertino_calc/views/home/widgets/buttons.dart';
import 'package:cupertino_calc/views/home/widgets/circle_button.dart';
import 'package:cupertino_calc/views/home/widgets/oval_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalcCubit(),
      child: BlocBuilder<CalcCubit, CalcState>(
        builder: (context, state) {
          TextEditingController calcController = TextEditingController()
            ..text = state.enteredTask;
          if (state.status == CalcStatus.failure) {
            MyUtils.getMyToast(message: "Unsupported operation", context: context);
          }
          return Scaffold(
            backgroundColor: MyColors.black,
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                  ),
                  TextField(
                    textDirection: TextDirection.rtl,
                    showCursor: false,
                    readOnly: true,
                    controller: calcController,
                    style: MyFonts.w400.copyWith(
                      fontSize: 80.sp,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                  const Expanded(
                    child: CalcButtons(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OvalButton(
                          title: "0",
                          onTap: () =>
                              context.read<CalcCubit>().addCharacter("0"),
                        ),
                        CircleButton(title: ".", onTap: () => context.read<CalcCubit>().addCharacter("."),),
                        CircleButton(
                          title: "=",
                          onTap: () => context.read<CalcCubit>().calculate(),
                          color: MyColors.cFF9500,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

