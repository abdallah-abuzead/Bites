import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkChecker {
  Future<bool> get isConnected;
}

class NetworkCheckerPlusImpl implements NetworkChecker {
  final InternetConnection connectionChecker;

  NetworkCheckerPlusImpl({required this.connectionChecker});

  @override
  Future<bool> get isConnected => connectionChecker.hasInternetAccess;
}
