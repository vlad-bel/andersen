import 'package:andersen_test1/data/users/interactor/users_interactor.dart';
import 'package:andersen_test1/flows/auth/signin/sigin_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:get_it/get_it.dart';

class SigninState {}

@singleton
class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninState());

  final usersInteractor = GetIt.instance.get<UsersInteractor>;

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
}
