import 'package:demo_2026/feature/failure/failure.build.dart';
import 'package:demo_2026/feature/result/result.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/models/recipe.build.dart';

abstract interface class InitialScreenRemoteDataSource {
  ResultFuture<List<Recipe>, Failure> fetchData();
}
