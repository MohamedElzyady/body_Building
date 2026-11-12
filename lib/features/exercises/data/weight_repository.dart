import 'package:shared_preferences/shared_preferences.dart';

/// Persists per-exercise last weight values using [SharedPreferences].
/// The [SharedPreferences] instance is injected at construction time
/// (initialized once in main() before runApp), so no repeated getInstance() calls occur.
/// Keys are prefixed with [_prefix] to avoid collisions with other stored data.
class WeightRepository {
  static const String _prefix = 'exercise_weight_';

  final SharedPreferences _prefs;

  WeightRepository(this._prefs);

  /// Returns the stored weight for [exerciseName], or null if not set.
  double? getWeight(String exerciseName) {
    return _prefs.getDouble(_buildKey(exerciseName));
  }

  /// Saves [weight] for [exerciseName].
  Future<void> saveWeight(String exerciseName, double weight) async {
    await _prefs.setDouble(_buildKey(exerciseName), weight);
  }

  /// Loads all stored exercise weights as a map of exerciseName → weight.
  Map<String, double> loadAll() {
    final result = <String, double>{};
    for (final key in _prefs.getKeys()) {
      if (key.startsWith(_prefix)) {
        final value = _prefs.getDouble(key);
        if (value != null) result[key.substring(_prefix.length)] = value;
      }
    }
    return result;
  }

  String _buildKey(String exerciseName) => '$_prefix$exerciseName';
}
