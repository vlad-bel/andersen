import 'dart:convert';
import 'package:andersen_test1/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class UserManager {
  User? user;

  Future<void> init() async {
    user = await getUser();
  }

  static const _userKey = 'user';

  Future<void> setUser(User user) async {
    this.user = user;

    try {
      final _prefs = await SharedPreferences.getInstance();
      final encodedUser = encodeUserToString(user);
      final bool isSaved = await _prefs.setString(
        _userKey,
        encodedUser,
      );
      debugPrint('user is saved ${isSaved ? "successfully" : "not successfully"}');
      return;
    } catch (_) {
      debugPrint('encoding_user_to_string_is_failed');
    }
  }

  Future<User?> getUser() async {
    final _prefs = await SharedPreferences.getInstance();
    final userJson = _prefs.getString(_userKey);

    if (userJson != null) {
      try {
        final user = User.fromMap(jsonDecode(userJson));

        debugPrint("saved_used: $user");
        return user;
      } catch (_) {
        debugPrint('decoding_string_to_user_is_failed');
      }
    }

    return null;
  }

  Future<void> removeUser() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove(_userKey);
  }
}
