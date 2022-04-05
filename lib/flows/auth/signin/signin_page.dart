import 'package:andersen_test1/flows/auth/signin/sigin_form.dart';
import 'package:andersen_test1/navigation/app_state_cubit/app_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  static const path = "/";

  @override
  Widget build(BuildContext context) {
    final appStateCubit = BlocProvider.of<AppStateCubit>(context);

    return const SigninForm();
  }
}
