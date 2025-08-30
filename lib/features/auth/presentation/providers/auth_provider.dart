import 'package:bites/core/di/app_injections.dart';
import 'package:bites/features/auth/domain/entities/requests/login_request.dart';
import 'package:bites/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/failures.dart';

part 'auth_provider.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loadingLogin() = LoadingLogin;
  const factory AuthState.successLogin(String token) = SuccessLogin;
  const factory AuthState.errorLogin({required Failure failure}) = ErrorLogin;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;

  AuthNotifier({required this.loginUseCase}) : super(const AuthState.initial());

  Future<void> login(LoginRequest request) async {
    state = const AuthState.loadingLogin();
    final result = await loginUseCase(request);
    result.fold(
      (failure) => state = AuthState.errorLogin(failure: failure),
      (token) => state = AuthState.successLogin(token),
    );
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(loginUseCase: getIt()),
);
