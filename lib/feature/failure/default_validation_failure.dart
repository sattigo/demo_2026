import 'package:demo_2026/feature/failure/custom_failure.dart';

/// This class used for validation error type
class DefaultValidationFailure extends CustomFailure {
  DefaultValidationFailure({required this.title, required this.errors, required this.meta});

  final String? title;
  final Map<String, dynamic> errors;
  final Map<String, dynamic>? meta;
}
