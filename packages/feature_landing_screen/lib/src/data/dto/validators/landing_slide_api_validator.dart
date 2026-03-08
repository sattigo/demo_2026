import 'package:core_chain/core_chain.dart';
import 'package:feature_landing_screen/src/data/dto/models/landing_slide_api.build.dart';
import 'package:feature_landing_screen/src/data/dto/validators/landing_slide_api_validator_exception.dart';

class LandingSlideApiValidator extends ChainValidator<List<LandingSlideApi>> {
  @override
  List<LandingSlideApi> validate(List<LandingSlideApi>? inParam) {
    if (inParam == null) {
      throw LandingSlideApiValidatorException();
    }

    for (final slide in inParam) {
      if (slide.id == null) {
        throw LandingSlideApiValidatorException();
      }
    }

    return inParam;
  }
}
