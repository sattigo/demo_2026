import 'package:core_chain/core_chain.dart';
import 'package:feature_landing_screen/src/data/dto/models/landing_slide_api.build.dart';
import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';

class LandingSlideTransformer extends ChainTransformer<List<LandingSlideApi>, List<LandingSlide>> {
  @override
  List<LandingSlide>? transform(List<LandingSlideApi> inParam) {
    final fullList = inParam.map(_toSlide).nonNulls.toList();
    if (fullList.length > 3) {
      final resultList = fullList.getRange(0, 3).toList();
      return resultList;
    } else {
      return fullList;
    }
  }

  LandingSlide? _toSlide(LandingSlideApi inParam) {
    final id = inParam.id;
    if (id == null) {
      return null;
    }

    return LandingSlide(
      id: id.toString(),
      title: inParam.title,
      subtitle: inParam.subtitle,
      imageUrl: inParam.imageUrl != null ? Uri.tryParse(inParam.imageUrl!) : null,
    );
  }
}
