import 'package:core_failure/core_failure.dart';
import 'package:demo_2026/feature/result/result.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/models/recipe.build.dart';

abstract interface class InitialScreenRepository {
  ResultFuture<List<Recipe>, Failure> fetchData();
}
