// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/comments/interactor/comments_interactor.dart' as _i14;
import '../data/comments/interactor/default_comments_interactor.dart' as _i15;
import '../data/comments/repository/comments_repository.dart' as _i4;
import '../data/comments/repository/default_comments_repository.dart' as _i5;
import '../data/users/interactor/default_users_interactor.dart' as _i17;
import '../data/users/interactor/users_interactor.dart' as _i16;
import '../data/users/repository/db_users_repository.dart' as _i13;
import '../data/users/repository/users_repository.dart' as _i12;
import '../flows/app/datalist/datalist_cubit.dart' as _i6;
import '../flows/app/user_details/user_details_cubit.dart' as _i10;
import '../flows/auth/signin/bloc/signin_cubit.dart' as _i8;
import '../flows/auth/signup/bloc/signup_cubit.dart' as _i9;
import '../network/api_manager.dart' as _i3;
import '../service/db.dart' as _i7;
import '../service/user_manager.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.ApiManager>(_i3.ApiManager());
  gh.singleton<_i4.CommentsRepository>(_i5.DefaultCommentsRepository());
  gh.singleton<_i7.MyDatabase>(_i7.MyDatabase());

  gh.singleton<_i11.UserManager>(_i11.UserManager());
  gh.singleton<_i12.UsersRepository>(_i13.DbUserRepository());
  gh.singleton<_i14.CommentsInteractor>(_i15.DefaultCommentsInteractor(
      repository: get<_i4.CommentsRepository>()));
  gh.singleton<_i16.UsersInteractor>(
      _i17.DefaultUsersInteractor(repository: get<_i12.UsersRepository>()));

  gh.singleton<_i8.SigninCubit>(_i8.SigninCubit());
  gh.singleton<_i9.SignupCubit>(_i9.SignupCubit());
  gh.singleton<_i10.UserDetailsCubit>(_i10.UserDetailsCubit());
  gh.singleton<_i6.DataListCubit>(_i6.DataListCubit());

  return get;
}
