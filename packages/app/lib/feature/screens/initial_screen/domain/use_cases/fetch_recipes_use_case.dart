import 'package:demo_2026/feature/failure/failure.build.dart';
import 'package:demo_2026/feature/result/result.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/models/recipe.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/repositories/repository_contract.dart';

class FetchRecipesUseCase {
  FetchRecipesUseCase({required InitialScreenRepository repository})
      : _repository = repository;

  final InitialScreenRepository _repository;

  ResultFuture<List<Recipe>, Failure> call() => _repository.fetchData();
}
