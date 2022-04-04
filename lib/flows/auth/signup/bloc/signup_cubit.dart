import 'package:andersen_test1/data/users/interactor/users_interactor.dart';
import 'package:andersen_test1/flows/auth/signin/sigin_form.dart';
import 'package:andersen_test1/flows/auth/signup/signup_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:get_it/get_it.dart';

class SignupState {}

@singleton
class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupState());

  final usersInteractor = GetIt.instance.get<UsersInteractor>;

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

  void signup({required dynamic group}) {
    if (group is! Map<String, Object?>) return;

    final email = group[SignupForm.emailFormControlName] as String;
    final password = group[SignupForm.passwordFormControlName] as String;
  }
}