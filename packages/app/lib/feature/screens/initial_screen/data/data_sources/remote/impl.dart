import 'package:demo_2026/feature/failure/failure.build.dart';
import 'package:demo_2026/feature/result/result.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/data_sources/remote/contract.dart';

class InitialScreenRemoteDataSourceImpl implements InitialScreenRemoteDataSource {
  @override
  ResultFuture<String, Failure> fetchData() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return const Result.failure(Failure.general());
  }
}
