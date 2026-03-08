import 'dart:collection';

import 'package:core_chain/core_chain.dart';
import 'package:feature_landing_screen/src/data/dto/models/landing_slide_api.build.dart';

class LandingSlideApiTransformer extends ChainTransformer<LinkedHashMap<String, dynamic>, List<LandingSlideApi>> {
  @override
  List<LandingSlideApi>? transform(LinkedHashMap<String, dynamic> inParam) {
    final resultList = <LandingSlideApi>[];
    final list = inParam['users'] as List<dynamic>;
    for (final (item as Map<String, dynamic>) in list) {
      resultList.add(LandingSlideApi.fromJson(item));
    }
    return resultList;
  }
}
