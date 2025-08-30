class ServerException implements Exception {}

class ConnectionTimeoutException implements Exception {}

class ConnectionErrorException implements Exception {}

class OfflineException implements Exception {}

class ValidationException implements Exception {
  final String message;
  ValidationException({required this.message});
}

class UnauthorizedException implements Exception {
  final String? message;
  UnauthorizedException({this.message});
}

class RegenerateTokenException implements Exception {}
class EmptyCashException implements Exception {}

class DataTypeChangeException implements Exception {}
