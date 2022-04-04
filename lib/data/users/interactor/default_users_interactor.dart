import 'package:andersen_test1/data/models/user.dart';
import 'package:andersen_test1/data/users/interactor/users_interactor.dart';
import 'package:andersen_test1/data/users/repository/users_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: UsersInteractor)
class DefaultUsersInteractor implements UsersInteractor {
  final UsersRepository repository;

  DefaultUsersInteractor({
    required this.repository,
  });

  @override
  Future<void> createUser({
    required String email,
    required String password,
    required DateTime registerTime,
  }) {
    return repository.createUser(
      email: email,
      password: password,
      registerTime: registerTime,
    );
  }

  @override
  Future<User?> getUser({
    required int userId,
  }) {
    return repository.getUser(
      userId: userId,
    );
  }
}
