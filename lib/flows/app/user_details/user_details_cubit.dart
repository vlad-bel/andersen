import 'package:andersen_test1/data/models/user.dart';
import 'package:andersen_test1/service/user_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

class UserDetailsState extends Equatable {
  final User? user;

  const UserDetailsState({
    this.user,
  });

  @override
  List<Object?> get props => [user];
}

@singleton
class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit({
    required this.usersManager,
  }) : super(UserDetailsState(user: usersManager.user)) {
    init();
  }

  final UserManager usersManager;

  void init() async {
    var user = await usersManager.getUser();
    emit(UserDetailsState(user: user));
  }

  void logout({
    required VoidCallback logout,
  }) {
    usersManager.removeUser();
    logout();
  }
}
