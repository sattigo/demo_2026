import 'package:demo_2026/feature/failure/custom_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.build.freezed.dart';

/// Standard error class.
///
/// [Failure.general] - default error for all cases, where no need to respond
/// to server response or for absolutely unusual situations.
///
/// [Failure.userFriendly] - error to display to end app user.
///
/// [Failure.custom] - error for specific scenarios. For example, see `default_validation_failure.dart`.
@freezed
sealed class Failure with _$Failure {
  const factory Failure.general() = FailureGeneral;

  /// [title] and [errors] usually displays in AlertDialogs. [meta] - additional data field
  const factory Failure.userFriendly({String? title, @Default([]) List<String> errors, Map<String, dynamic>? meta}) =
      FailureUserFriendly;

  const factory Failure.custom({required CustomFailure custom}) = FailureCustom;
}
