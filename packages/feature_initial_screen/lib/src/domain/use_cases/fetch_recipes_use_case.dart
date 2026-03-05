import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_initial_screen/src/domain/models/recipe.build.dart';
import 'package:feature_initial_screen/src/domain/repositories/repository_contract.dart';

class FetchRecipesUseCase {
  FetchRecipesUseCase({required InitialScreenRepository repository}) : _repository = repository;

  final InitialScreenRepository _repository;

  ResultFuture<List<Recipe>, Failure> call() => _repository.fetchData();
}
