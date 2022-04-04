import 'dart:convert';

import 'package:andersen_test1/data/models/app_error.dart';
import 'package:andersen_test1/data/models/user.dart';
import 'package:andersen_test1/data/users/repository/users_repository.dart';
import 'package:andersen_test1/service/db.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

@Singleton(as: UsersRepository)
class DbUserRepository implements UsersRepository {
  final MyDatabase database = GetIt.instance.get<MyDatabase>();

  @override
  Future<User?> createUser({
    required String email,
    required String password,
    required DateTime registerTime,
  }) async {
    try {
      final dbUser = DBUserCompanion(
        email: Value(email),
        registerTime: Value(registerTime),
        password: Value(utf8.encode(password).join()),
      );

      var user = await (database.select(database.dBUser)
            ..where((tbl) => tbl.email.equals(email)))
          .getSingleOrNull();

      if (user == null) {
        database.into(database.dBUser).insert(dbUser);
        return const User();
      }

      throw AppError(error: "user $email already exist");
    } catch (e) {
      throw AppError(error: "error createUser($email, $registerTime) => $e");
    }
  }

  @override
  Future<User?> getUser({
    required int userId,
  }) async {
    try {
      var user = await (database.select(database.dBUser)
            ..where((tbl) => tbl.id.equals(userId)))
          .getSingleOrNull();

      if (user != null) {
        return User(
          id: user.id,
          email: user.email,
          registerTime: user.registerTime,
        );
      }

      return null;
    } catch (e) {
      throw AppError(error: "error getUser($userId) => $e");
    }
  }
}
