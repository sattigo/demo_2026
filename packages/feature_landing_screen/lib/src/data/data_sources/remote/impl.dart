import 'package:core_chain/core_chain.dart';
import 'package:core_dio/core_dio.dart';
import 'package:core_failure/core_failure.dart';
import 'package:core_result/core_result.dart';
import 'package:feature_landing_screen/src/data/data_sources/remote/contract.dart';
import 'package:feature_landing_screen/src/data/dto/transformers/landing_slide_api_transformer.dart';
import 'package:feature_landing_screen/src/data/dto/transformers/landing_slide_transformer.dart';
import 'package:feature_landing_screen/src/data/dto/validators/landing_slide_api_validator.dart';
import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';

class LandingScreenRemoteDataSourceImpl implements LandingScreenRemoteDataSource {
  LandingScreenRemoteDataSourceImpl({required DioClient dioClient}) : _dioClient = dioClient;

  final DioClient _dioClient;

  @override
  ResultFuture<List<LandingSlide>, Failure> fetchSlides() async {
    final result = await _dioClient.get('/users');
    return result.when(
      onStatusCodes: {
        statusCodeSuccessRange: (response) {
          try {
            final slidesList = ChainPipeline.startWithValue(response.data)
                .transform(LandingSlideApiTransformer())
                .validate(LandingSlideApiValidator())
                .transform(LandingSlideTransformer())
                .getResult();
            if (slidesList != null) {
              return Result.success(slidesList);
            } else {
              return const Result.failure(Failure.general());
            }
          } on Object catch (e) {
            return Result.failure(Failure.userFriendly(errors: [e.toString()]));
          }
        },
      },
    );
  }
}
