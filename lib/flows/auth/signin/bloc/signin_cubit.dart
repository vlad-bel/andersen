import 'package:andersen_test1/config/app_string.dart';
import 'package:andersen_test1/data/models/app_error.dart';
import 'package:andersen_test1/data/users/interactor/users_interactor.dart';
import 'package:andersen_test1/flows/auth/signin/sigin_form.dart';
import 'package:andersen_test1/service/app_notifier.dart';
import 'package:andersen_test1/service/user_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:get_it/get_it.dart';

class SigninState {}

@singleton
class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninState());

  final usersInteractor = GetIt.instance.get<UsersInteractor>();
  final userManager = GetIt.instance.get<UserManager>();

  final fbGroup = fb.group(
    <String, Object>{
      SigninForm.emailFormControlName: FormControl<String>(
        validators: [
          Validators.required,
          Validators.email,
        ],
      ),
      SigninForm.passwordFormControlName: FormControl<String>(
        validators: [
          Validators.required,
          Validators.minLength(8),
        ],
      ),
    },
  );

  Future signin(
    FormGroup group,
    VoidCallback signin,
  ) async {
    //get data from form
    final email = group.value[SigninForm.emailFormControlName] as String;
    final password = group.value[SigninForm.passwordFormControlName] as String;

    try {
      final user = await usersInteractor.getUserByEmail(email: email);

      if (user != null) {
        final passHash = password.hashCode.toString();
        if (user.password == passHash) {
          userManager.setUser(user);

          // showMessage(
          //   message: "${AppString.welcome} ${user.email}",
          //   type: NotifyType.success,
          // );

          signin();

          return;
        }

        showMessage(
          message: AppString.wrongPassword,
          type: NotifyType.error,
        );
      }

      showMessage(
        message: AppString.userNotExists,
        type: NotifyType.error,
      );
    } on AppError catch (e) {
      showMessage(
        message: e.error,
        type: NotifyType.error,
      );
    }
  }
}
