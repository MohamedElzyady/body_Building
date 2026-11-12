import 'dart:convert';

import 'package:body_buliding/features/user/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists the onboarding user data using [SharedPreferences].
/// The [SharedPreferences] instance is injected at construction time
/// (initialized once in main() before runApp), so no repeated getInstance()
/// calls occur.
/// Keys are prefixed with [_prefix] to avoid collisions with exercise weight
/// data and other stored values.
class UserRepository {
  static const String _prefix = 'user_';
  static const String _userDataKey = '${_prefix}data';
  static const String _onboardingCompleteKey = '${_prefix}onboarding_complete';

  final SharedPreferences _prefs;

  UserRepository(this._prefs);

  /// Returns the stored [UserModel], or null if onboarding has not been
  /// completed or if reading/parsing fails.
  UserModel? loadUser() {
    try {
      final jsonString = _prefs.getString(_userDataKey);
      if (jsonString == null || jsonString.isEmpty) return null;
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return UserModel.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  /// Saves [user] data and marks onboarding as complete.
  Future<bool> saveUser(UserModel user) async {
    try {
      final jsonString = jsonEncode(user.toJson());
      await _prefs.setString(_userDataKey, jsonString);
      await _prefs.setBool(_onboardingCompleteKey, true);
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Returns whether the user has completed onboarding.
  bool isOnboardingComplete() {
    try {
      return _prefs.getBool(_onboardingCompleteKey) ?? false;
    } catch (_) {
      return false;
    }
  }

  /// Clears only the user/onboarding data. Does **not** touch exercise weights
  /// or any other stored data.
  Future<bool> clearUser() async {
    try {
      await _prefs.remove(_userDataKey);
      await _prefs.remove(_onboardingCompleteKey);
      return true;
    } catch (_) {
      return false;
    }
  }
}
