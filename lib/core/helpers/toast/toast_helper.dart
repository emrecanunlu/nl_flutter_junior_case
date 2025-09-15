import 'package:fluttertoast/fluttertoast.dart';
import 'package:jr_case_boilerplate/core/constants/app_colors.dart';

class ToastHelper {
  ToastHelper._();

  static void success(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.success,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static void error(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.error,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColors.white,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
