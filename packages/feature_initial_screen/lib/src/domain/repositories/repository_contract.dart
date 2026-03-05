import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_initial_screen/src/domain/models/recipe.build.dart';

abstract interface class InitialScreenRepository {
  ResultFuture<List<Recipe>, Failure> fetchData();
}
