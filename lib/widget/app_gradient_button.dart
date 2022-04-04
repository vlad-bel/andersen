import 'package:andersen_test1/config/colors.dart';
import 'package:andersen_test1/config/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AppButtonState { normal, unavailable }

class AppGradientButton extends StatelessWidget {
  const AppGradientButton({
    Key? key,
    this.title,
    required this.onPressed,
    this.state = AppButtonState.normal,
    this.child,
  }) : super(key: key);

  final String? title;
  final Widget? child;
  final VoidCallback onPressed;
  final AppButtonState state;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: state == AppButtonState.normal ? onPressed : null,
      padding: EdgeInsets.zero,
      child: Opacity(
        opacity: state == AppButtonState.unavailable ? 0.5 : 1.0,
        child: Container(
          height: 52,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.conifer2,
                AppColors.green,
              ],
            ),
          ),
          child: title != null
              ? Text(
                  title!,
                  style: AppTextStyles.bodySBold.copyWith(
                    color: Colors.white,
                  ),
                )
              : child,
        ),
      ),
    );
  }
}
