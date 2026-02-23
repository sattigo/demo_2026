class DefaultDioFailureException implements Exception {
  DefaultDioFailureException(String exception) : _exception = exception;
  final String _exception;

  @override
  String toString() {
    return _exception;
  }
}
