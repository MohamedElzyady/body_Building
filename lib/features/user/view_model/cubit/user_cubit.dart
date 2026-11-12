import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body_buliding/features/user/data/models/user_model.dart';
import 'package:body_buliding/features/user/data/user_repository.dart';
import 'package:body_buliding/features/user/view_model/cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _repository;

  UserCubit(this._repository) : super(UserState.initial());

  /// Loads persisted user data from local storage.
  /// Called once at app startup.
  Future<void> loadUser() async {
    try {
      emit(state.copyWith(isLoading: true));
      final user = _repository.loadUser();
      emit(state.copyWith(
        user: user,
        isLoading: false,
        clearError: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        clearUser: true,
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }

  /// Sets the user in state and persists to local storage.
  Future<void> setUser(UserModel user) async {
    emit(state.copyWith(user: user, clearError: true));
    try {
      await _repository.saveUser(user);
    } catch (_) {}
  }

  /// Clears only user/onboarding data from local storage and resets state.
  /// Does **not** affect exercise weights or other stored data.
  Future<void> clearUser() async {
    try {
      await _repository.clearUser();
    } catch (_) {}
    emit(const UserState(user: null, isLoading: false));
  }

  void updateName(String name) {
    if (state.user != null) {
      final updated = state.user!.copyWith(name: name);
      emit(state.copyWith(user: updated));
      _repository.saveUser(updated);
    }
  }

  void updateAge(int age) {
    if (state.user != null) {
      final updated = state.user!.copyWith(age: age);
      emit(state.copyWith(user: updated));
      _repository.saveUser(updated);
    }
  }

  void updateHeight(double height) {
    if (state.user != null) {
      final updated = state.user!.copyWith(height: height);
      emit(state.copyWith(user: updated));
      _repository.saveUser(updated);
    }
  }

  void updateWeight(double weight) {
    if (state.user != null) {
      final updated = state.user!.copyWith(weight: weight);
      emit(state.copyWith(user: updated));
      _repository.saveUser(updated);
    }
  }

  void updateGoal(String goal) {
    if (state.user != null) {
      final updated = state.user!.copyWith(goal: goal);
      emit(state.copyWith(user: updated));
      _repository.saveUser(updated);
    }
  }
}

