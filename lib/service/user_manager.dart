import 'dart:convert';
import 'package:andersen_test1/data/models/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class UserManager {
  User? user;

  Future<void> init() async {
    this.user = await getUser();
    print("UserManager user: ${this.user}");
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
      print('user is saved ${isSaved ? "successfully" : "not successfully"}');
      return;
    } catch (_) {
      print('encoding_user_to_string_is_failed');
    }
  }

  Future<User?> getUser() async {
    final _prefs = await SharedPreferences.getInstance();
    final userJson = _prefs.getString(_userKey);

    if (userJson != null) {
      try {
        final user = User.fromMap(jsonDecode(userJson));

        print("saved_used: $user");
        return user;
      } catch (_) {
        print('decoding_string_to_user_is_failed');
      }
    }

    return null;
  }

  Future<void> removeUser() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.remove(_userKey);
  }
}
