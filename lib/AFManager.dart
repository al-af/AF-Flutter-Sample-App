import 'package:appsflyer_sdk/appsflyer_sdk.dart';

class AFManager {
  AFManager._internal();

  static final AFManager _instance = AFManager._internal();

  late AppsflyerSdk appsflyerSdk;

  AppsflyerSdk getAFObject(AppsFlyerOptions appsFlyerOptions) {
    return appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
  }

  factory AFManager() {
    return _instance;
  }
}
