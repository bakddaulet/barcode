class ServerException implements Exception {
  String message;
  int? statusCode;
  ServerException({required this.message, this.statusCode});
}


