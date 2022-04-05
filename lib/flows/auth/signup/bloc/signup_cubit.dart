import 'package:andersen_test1/config/app_string.dart';
import 'package:andersen_test1/data/models/app_error.dart';
import 'package:andersen_test1/data/users/interactor/users_interactor.dart';
import 'package:andersen_test1/flows/auth/signin/bloc/signin_cubit.dart';
import 'package:andersen_test1/flows/auth/signin/sigin_form.dart';
import 'package:andersen_test1/flows/auth/signup/signup_form.dart';
import 'package:andersen_test1/service/app_notifier.dart';
import 'package:andersen_test1/service/user_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:get_it/get_it.dart';

class SignupState {}

@singleton
class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  final usersInteractor = GetIt.instance.get<UsersInteractor>();
  final userManager = GetIt.instance.get<UserManager>();
  final signinCubit = GetIt.instance.get<SigninCubit>();

  final fbGroup = fb.group(
    <String, Object>{
      SignupForm.emailFormControlName: FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      SignupForm.passwordFormControlName: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
    },
  );

  Future signup({
    required FormGroup group,
    required VoidCallback registerSuccess,
  }) async {
    //get data from form
    final email = group.value[SignupForm.emailFormControlName] as String;
    final password = group.value[SignupForm.passwordFormControlName] as String;
    try {
      //check if it already exist
      var user = await usersInteractor.getUserByEmail(email: email);

      //register
      if (user == null) {
        //register user
        user = await usersInteractor.createUser(
          email: email,
          password: password,
          registerTime: DateTime.now(),
        );

        showMessage(
          message: AppString.emailRegistered,
          type: NotifyType.success,
        );

        fbGroup.value = {
          SignupForm.emailFormControlName: "",
          SignupForm.passwordFormControlName: "",
        };

        signinCubit.fbGroup.value = {
          SigninForm.emailFormControlName: email,
          SigninForm.passwordFormControlName: password,
        };
        registerSuccess();
        return;
      }

      showMessage(
        message: AppString.userExists,
        type: NotifyType.error,
      );
      // add already exist error
    } on AppError catch (e) {
      //add creation error
      showMessage(message: e.error, type: NotifyType.error);
    }
  }
}
