import 'package:demo_2026/feature/failure/failure.build.dart';
import 'package:demo_2026/feature/result/result.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/models/recipe.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/repositories/repository_contract.dart';

class InitialScreenRepositoryImpl implements InitialScreenRepository {
  @override
  ResultFuture<List<Recipe>, Failure> fetchData() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return const Result.failure(Failure.general());
  }
}
