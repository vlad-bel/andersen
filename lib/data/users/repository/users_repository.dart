import 'package:andersen_test1/data/models/user.dart';
import 'package:injectable/injectable.dart';

abstract class UsersRepository {
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
