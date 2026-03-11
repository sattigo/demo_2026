import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_home_screen/src/domain/models/recipe.build.dart';
import 'package:feature_home_screen/src/domain/repositories/contract.dart';

class FetchRecipesUseCase {
  FetchRecipesUseCase({required HomeScreenRepository repository}) : _repository = repository;

  final HomeScreenRepository _repository;

  ResultFuture<List<Recipe>, Failure> call() => _repository.fetchData();
}
