// Flutter can only load PathUrlStrategy as Webapp. So we replace it with a proxy
// function, that is a NoOp when loaded as App.
// https://docs.flutter.dev/development/ui/navigation/url-strategies#cross-platform-setup
export 'url_strategy_noop.dart' if (dart.library.html) 'url_strategy_web.dart';
