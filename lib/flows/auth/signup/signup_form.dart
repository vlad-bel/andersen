import 'package:andersen_test1/config/app_string.dart';
import 'package:andersen_test1/config/colors.dart';
import 'package:andersen_test1/config/styles.dart';
import 'package:andersen_test1/flows/auth/signin/bloc/signin_cubit.dart';
import 'package:andersen_test1/flows/auth/signin/signin_page.dart';
import 'package:andersen_test1/flows/auth/signup/bloc/signup_cubit.dart';
import 'package:andersen_test1/widget/app_gradient_button.dart';
import 'package:andersen_test1/widget/app_reactive_text_field/app_reactive_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sizer/sizer.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  static const emailFormControlName = 'email';
  static const passwordFormControlName = 'password';

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: BlocBuilder<SignupCubit, SignupState>(
          builder: (context, state) {
            return ReactiveForm(
              formGroup: BlocProvider.of<SignupCubit>(context).fbGroup,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppString.signup,
                    style: AppTextStyles.h1,
                  ),
                  SizedBox(height: 3.h),
                  AppReactiveTextField(
                    formControlName: SignupForm.emailFormControlName,
                    validationMessages: (_) => {
                      ValidationMessage.required: AppString.emailRequired,
                      ValidationMessage.email: AppString.emailMustBeValid,
                    },
                    labelText: AppString.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 10),
                  AppReactiveTextField(
                    formControlName: SignupForm.passwordFormControlName,
                    validationMessages: (_) => {
                      ValidationMessage.required: AppString.passwordRequired,
                      ValidationMessage.minLength:
                          AppString.passwordMustBeValid,
                    },
                    textInputAction: TextInputAction.done,
                    labelText: AppString.password,
                    passwordMode: true,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ReactiveFormConsumer(
                    builder: (
                      BuildContext context,
                      FormGroup formGroup,
                      Widget? child,
                    ) {
                      print(
                          'signup formgroup:${formGroup.value}, valid:${formGroup.valid} ');
                      return AppGradientButton(
                        title: AppString.signup,
                        onPressed: () {},
                        state: formGroup.valid == true
                            ? AppButtonState.normal
                            : AppButtonState.unavailable,
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Routemaster.of(context).push(
                        SigninPage.path,
                        // queryParameters: {},
                      );
                    },
                    child: Text(
                      AppString.signin,
                      style: AppTextStyles.captionBold.copyWith(
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
