import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'my_colors.dart';
import 'my_fonts.dart';

class MyUtils {
  static getMyToast({required String message, required BuildContext context}) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: MyColors.c333333,
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static String capitalize(String word) {
    return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
  }

  static showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text ?? "",
          style: MyFonts.w500.copyWith(
            fontSize: 16,
            color: MyColors.white,
          ),
        ),
        backgroundColor: MyColors.c333333,
      ),
    );
  }

  static showLoader(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
