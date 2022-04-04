// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/users/interactor/default_users_interactor.dart' as _i10;
import '../data/users/interactor/users_interactor.dart' as _i9;
import '../data/users/repository/db_users_repository.dart' as _i8;
import '../data/users/repository/users_repository.dart' as _i7;
import '../flows/auth/signin/bloc/signin_cubit.dart' as _i4;
import '../flows/auth/signup/bloc/signup_cubit.dart' as _i5;
import '../service/db.dart' as _i3;
import '../service/user_manager.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.MyDatabase>(_i3.MyDatabase());
  gh.singleton<_i4.SigninCubit>(_i4.SigninCubit());
  gh.singleton<_i5.SignupCubit>(_i5.SignupCubit());
  gh.singleton<_i6.UserManager>(_i6.UserManager());
  gh.singleton<_i7.UsersRepository>(_i8.DbUserRepository());
  gh.singleton<_i9.UsersInteractor>(
      _i10.DefaultUsersInteractor(repository: get<_i7.UsersRepository>()));
  return get;
}
