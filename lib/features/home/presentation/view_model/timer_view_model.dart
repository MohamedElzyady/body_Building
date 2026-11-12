import 'package:flutter/foundation.dart';

/// ViewModel managing the business logic and countdown states for the Rest Timer.
/// Exposes properties as simple primitives, completely independent of Flutter Material UI.
class TimerViewModel extends ChangeNotifier {
  final int _duration = 90; // 120 seconds total rest duration
  bool _isPlaying = false; // Initially paused/stopped
  int _currentSet = 2;
  final int _totalSets = 4;
  final String _exerciseName = 'بنش برس بالبار';

  int get duration => _duration;
  bool get isPlaying => _isPlaying;
  int get currentSet => _currentSet;
  int get totalSets => _totalSets;
  String get exerciseName => _exerciseName;

  /// Toggles the play/pause state of the timer.
  void togglePlayPause() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  /// Sets the play/pause state explicitly.
  void setPlaying(bool playing) {
    if (_isPlaying != playing) {
      _isPlaying = playing;
      notifyListeners();
    }
  }

  /// Handles the timer reset action. Sets playing to true to auto-start after reset.
  void reset() {
    _isPlaying = true;
    notifyListeners();
  }

  /// Skips the rest or handles transition to the next set. Sets playing to true.
  void skipOrComplete() {
    if (_currentSet < _totalSets) {
      _currentSet++;
    } else {
      _currentSet = 1; // Loop back to set 1 for demonstration/reset purposes
    }
    _isPlaying = true;
    notifyListeners();
  }
}
