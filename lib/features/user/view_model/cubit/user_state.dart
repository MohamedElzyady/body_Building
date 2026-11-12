import 'package:body_buliding/features/user/data/models/user_model.dart';

class UserState {
  final UserModel? user;
  final bool isLoading;
  final String? errorMessage;

  const UserState({
    this.user,
    this.isLoading = false,
    this.errorMessage,
  });

  factory UserState.initial() {
    return const UserState(user: null, isLoading: true);
  }

  UserState copyWith({
    UserModel? user,
    bool? isLoading,
    String? errorMessage,
    bool clearUser = false,
    bool clearError = false,
  }) {
    return UserState(
      user: clearUser ? null : (user ?? this.user),
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}

