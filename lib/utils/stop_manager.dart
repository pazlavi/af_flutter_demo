import 'package:appsflyer_sdk/appsflyer_sdk.dart';

class AFStopManager{
  static  AFStopManager? _instance;
  final AppsflyerSdk appsflyerSdk = AppsflyerSdk(null);
  late bool stop;

  AFStopManager._internal(){
    stop = false;
  }

  static AFStopManager getInstance() {
    if (_instance == null) {
      _instance = AFStopManager._internal();
    }

    return _instance!;
  }

  bool changeStopState(){
    stop = !stop;
    print("stop = $stop");
    appsflyerSdk.stop(stop);
    return stop;
  }
}