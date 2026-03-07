import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_home_screen/src/domain/models/recipe.build.dart';

abstract interface class HomeScreenRemoteDataSource {
  ResultFuture<List<Recipe>, Failure> fetchData();
}
