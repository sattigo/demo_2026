package com.sattigo.feature_map_screen

import com.yandex.mapkit.MapKitFactory
import io.flutter.embedding.engine.plugins.FlutterPlugin

class MapScreenPlugin : FlutterPlugin {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        MapKitFactory.setApiKey(BuildConfig.YANDEX_MAPKIT_API_KEY)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {}
}
