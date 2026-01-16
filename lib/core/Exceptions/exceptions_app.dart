abstract class ExceptionsApp implements Exception {
  String errorMessage;
  int? statusCode;

  ExceptionsApp({required this.errorMessage, required this.statusCode});
}

class ServerError extends ExceptionsApp {
  ServerError({required super.errorMessage, super.statusCode});
}

class NetworkError extends ExceptionsApp {
  NetworkError({required super.errorMessage, super.statusCode});
}

class UnExpectedError extends ExceptionsApp {
  UnExpectedError({required super.errorMessage, super.statusCode});
}
