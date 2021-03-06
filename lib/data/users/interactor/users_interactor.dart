import 'package:injectable/injectable.dart';

import '../../models/user.dart';

abstract class UsersInteractor {
  Future<void> createUser({
    required String email,
    required String password,
    required DateTime registerTime,
  });

  Future<User?> getUser({
    required int userId,
  });
}
