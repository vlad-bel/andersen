import 'package:andersen_test1/navigation/app_map.dart';
import 'package:andersen_test1/navigation/auth_map.dart';
import 'package:andersen_test1/navigation/splash_map.dart';
import 'package:andersen_test1/service/user_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:routemaster/routemaster.dart';
import 'package:andersen_test1/injectible/injectible_init.dart';

part '../app_state_cubit/app_state.dart';

class AppStateCubit extends Cubit<AppState> {
  late final UserManager _userManager;

  AppStateCubit() : super(SplashState()) {
    _init();
  }

  Future<void> _init() async {
    configureDependencies();

    _userManager = GetIt.instance.get<UserManager>();
    await _userManager.init();

    await checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    final user = await _userManager.getUser();

    if (user != null) {
      emit(AuthorizedState());
      return;
    }

    emit(UnauthorizedState());
  }

  void goToMainFlow() async {
    emit(AuthorizedState());
  }

  void logout() async {
    emit(UnauthorizedState());
  }
}
