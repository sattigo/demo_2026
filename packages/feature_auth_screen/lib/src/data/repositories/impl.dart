import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_auth_screen/src/domain/repositories/repository_contract.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  ResultFuture<void, Failure> login({required String email, required String password}) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return const Result.success(null);
  }
}
