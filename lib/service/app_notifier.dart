import 'package:andersen_test1/config/colors.dart';
import 'package:andersen_test1/config/styles.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

enum NotifyType {
  success,
  error,
}

void showMessage({
  required String message,
  required NotifyType type,
}) {
  final SnackBar snackBar = SnackBar(
    content: Text(
      message,
      style: AppTextStyles.sfProDisplaySemiBold17.copyWith(
        color: AppColors.white,
      ),
    ),
    backgroundColor:
        type == NotifyType.success ? AppColors.darkGreen : AppColors.darkRed,
  );
  snackbarKey.currentState?.showSnackBar(snackBar);
}
