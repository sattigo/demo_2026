import 'package:core_navigation/core_navigation.dart';
import 'package:feature_map_screen/feature_map_screen.dart';
import 'package:flutter/foundation.dart';

class MapScreenPage extends BasePage {
  const MapScreenPage()
    : super(
        widget: const MapScreenView(),
        key: const ValueKey(MapScreenPage),
        transition: const SlideFromRightTransition(),
      );
}
