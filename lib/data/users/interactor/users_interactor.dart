import '../../models/user.dart';

abstract class UsersInteractor {
  Future<User?> createUser({
    required String email,
    required String password,
    required DateTime registerTime,
  });

  Future<User?> getUser({
    required int userId,
  });

  Future<User?> getUserByEmail({
    required String email,
  });
}
