class TooManyRequestsException implements Exception {
  final String message;
  TooManyRequestsException(this.message);
}
