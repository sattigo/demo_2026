import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_auth_screen/src/domain/repositories/repository_contract.dart';

class LoginUseCase {
  LoginUseCase({required AuthRepository repository}) : _repository = repository;

  final AuthRepository _repository;

  ResultFuture<void, Failure> call({required String email, required String password}) =>
      _repository.login(email: email, password: password);
}
