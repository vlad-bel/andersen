import 'package:andersen_test1/config/app_string.dart';
import 'package:andersen_test1/config/colors.dart';
import 'package:andersen_test1/config/styles.dart';
import 'package:andersen_test1/flows/auth/signin/bloc/signin_cubit.dart';
import 'package:andersen_test1/flows/auth/signin/signin_page.dart';
import 'package:andersen_test1/flows/auth/signup/bloc/signup_cubit.dart';
import 'package:andersen_test1/flows/auth/signup/signup_form.dart';
import 'package:andersen_test1/flows/auth/signup/signup_page.dart';
import 'package:andersen_test1/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:andersen_test1/widget/app_gradient_button.dart';
import 'package:andersen_test1/widget/app_reactive_text_field/app_reactive_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sizer/sizer.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({Key? key}) : super(key: key);

  static const emailFormControlName = 'email';
  static const passwordFormControlName = 'password';

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SigninCubit>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ReactiveForm(
          formGroup: BlocProvider.of<SigninCubit>(context).fbGroup,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppString.signin,
                style: AppTextStyles.h1,
              ),
              SizedBox(height: 3.h),
              AppReactiveTextField(
                formControlName: SigninForm.emailFormControlName,
                validationMessages: (_) => {
                  ValidationMessage.required: AppString.emailRequired,
                  ValidationMessage.email: AppString.emailMustBeValid,
                },
                labelText: AppString.email,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),
              AppReactiveTextField(
                formControlName: SigninForm.passwordFormControlName,
                validationMessages: (_) => {
                  ValidationMessage.required: AppString.passwordRequired,
                  ValidationMessage.minLength: AppString.passwordMustBeValid,
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
                      'signin formgroup:${formGroup.value}, valid:${formGroup.valid} ');
                  return AppGradientButton(
                    title: AppString.signin,
                    onPressed: () {
                      cubit.signin(
                        cubit.fbGroup,
                        () {
                          final appCubit =
                              BlocProvider.of<AppStateCubit>(context);
                          appCubit.goToMainFlow();
                        },
                      );
                    },
                    state: formGroup.valid == true
                        ? AppButtonState.normal
                        : AppButtonState.unavailable,
                  );
                },
              ),
              TextButton(
                onPressed: () async {
                  Routemaster.of(context).push(
                    SignupPage.path,
                  );
                },
                child: Text(
                  AppString.signup,
                  style: AppTextStyles.captionBold.copyWith(
                    color: AppColors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
