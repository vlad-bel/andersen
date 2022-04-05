import 'package:andersen_test1/flows/auth/signup/signup_form.dart';
import 'package:andersen_test1/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  static const path = "/signup";

  @override
  Widget build(BuildContext context) {
    final appStateCubit = BlocProvider.of<AppStateCubit>(context);

    return const SignupForm();
  }
}
