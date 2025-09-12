import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';

class ToastHelper {
  ToastHelper._();

  static success(String message, {BuildContext? context}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.success,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static error(String message, {BuildContext? context}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.error,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
