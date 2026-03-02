import 'package:demo_2026/feature/failure/failure.build.dart';
import 'package:demo_2026/feature/result/result.build.dart';

abstract interface class InitialScreenRemoteDataSource {
  ResultFuture<String, Failure> fetchData();
}
