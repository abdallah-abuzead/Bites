import '../../../domain/entities/requests/login_request.dart';

class LoginRequestModel extends LoginRequest {
  const LoginRequestModel({required super.username, required super.password});

  factory LoginRequestModel.fromEntity(LoginRequest entity) {
    return LoginRequestModel(username: entity.username, password: entity.password);
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
