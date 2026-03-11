import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';

abstract interface class AuthRepository {
  ResultFuture<void, Failure> login({required String email, required String password});
}
