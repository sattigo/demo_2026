import Flutter
import YandexMapsMobile

public class MapScreenPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let apiKey = MapScreenApiKey.value
        if !apiKey.isEmpty {
            YMKMapKit.setApiKey(apiKey)
        }
    }
}
