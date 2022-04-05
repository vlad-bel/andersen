import 'package:andersen_test1/data/models/user.dart';
import 'package:andersen_test1/service/user_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

class UserDetailsState extends Equatable {
  final User? user;

  UserDetailsState({
    this.user,
  });

  @override
  List<Object?> get props => [user];
}

@singleton
class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsState(user: usersManager.user)) {
    init();
  }

  static final usersManager = GetIt.instance.get<UserManager>();

  void init() async {
    var user = await usersManager.getUser();
    print("my user: ${user}");
    emit(UserDetailsState(user: user));
  }

  void logout({
    required VoidCallback logout,
  }) {
    usersManager.removeUser();
    logout();
  }
}
