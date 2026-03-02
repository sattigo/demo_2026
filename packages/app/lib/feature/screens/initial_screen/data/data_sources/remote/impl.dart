import 'package:demo_2026/feature/chain/chainable.dart';
import 'package:demo_2026/feature/dio/client/dio_client.dart';
import 'package:demo_2026/feature/dio/client/dio_result.dart';
import 'package:demo_2026/feature/failure/failure.build.dart';
import 'package:demo_2026/feature/result/result.build.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/data_sources/remote/contract.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/dto/transformers/recipe_api_transformer.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/dto/transformers/recipe_transformer.dart';
import 'package:demo_2026/feature/screens/initial_screen/data/dto/validators/recipe_api_validator.dart';
import 'package:demo_2026/feature/screens/initial_screen/domain/models/recipe.build.dart';

class InitialScreenRemoteDataSourceImpl implements InitialScreenRemoteDataSource {
  InitialScreenRemoteDataSourceImpl({required DioClient dioClient}) : _dioClient = dioClient;
  final DioClient _dioClient;

  @override
  ResultFuture<List<Recipe>, Failure> fetchData() async {
    final result = await _dioClient.get('/recipes');
    return result.when(
      onStatusCodes: {
        statusCodeSuccessRange: (response) {
          try {
            final recipesList = ChainPipeline.startWithValue(response.data)
                .transform(RecipeApiTransformer())
                .validate(RecipeApiValidator())
                .transform(RecipeTransformer())
                .getResult();
            if (recipesList != null) {
              return Result.success(recipesList);
            } else {
              return const Result.failure(Failure.general());
            }
          } on Object catch (_) {
            return const Result.failure(Failure.general());
          }
        },
      },
    );
  }
}
