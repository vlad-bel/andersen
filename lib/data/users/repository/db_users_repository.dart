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
      // var bytes = utf8.encode(password); // data being hashed
      // var digest = sha1.convert(bytes).bytes.toString();
      //
      // for (var table in database.allTables) {
      //   await database.delete(table).go();
      // }

      final dbUser = DBUserCompanion(
        email: Value(email),
        registerTime: Value(registerTime),
        password: Value(password.hashCode.toString()),
      );

      var user = await (database.select(database.dBUser)
            ..where((tbl) => tbl.email.equals(email)))
          .getSingleOrNull();

      if (user == null) {
        await database.into(database.dBUser).insert(dbUser);

        final test = await getUserByEmail(email: email);
        print(test);
        return User(
          email: email,
          password: password.hashCode.toString(),
          registerTime: registerTime,
        );
      }

      throw AppError(error: "user $email already exist");
    } catch (e) {
      throw AppError(
          error: "error createUser($email, $password, $registerTime) => $e");
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

  @override
  Future<User?> getUserByEmail({
    required String email,
  }) async {
    try {
      var user = await (database.select(database.dBUser)
            ..where((tbl) => tbl.email.equals(email)))
          .getSingleOrNull();

      if (user != null) {
        return User(
          id: user.id,
          email: user.email,
          password: user.password,
          registerTime: user.registerTime,
        );
      }

      return null;
    } catch (e) {
      throw AppError(error: "error getUser($email) => $e");
    }
  }
}
