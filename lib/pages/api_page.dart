import 'package:af_flutter_demo/utils/stop_manager.dart';
import 'package:af_flutter_demo/widgets/api_button.dart';
import 'package:af_flutter_demo/widgets/my_scaffold.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/material.dart';

class APIPage extends StatefulWidget {
  @override
  _APIPageState createState() => _APIPageState();
}

class _APIPageState extends State<APIPage> {
  final AppsflyerSdk _appsflyerSdk = AppsflyerSdk(null);
  String? _afId;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(body: getBody(), pageTitle: "API test page");
  }

  Widget getBody() {
    return Column(
      children: [
        getLogEventBtn(),
        getStopBtn(),
      ],
    );
  }

  Widget getLogEventBtn() {
    return ApiButton(
        onPressed: () => _appsflyerSdk.logEvent("af_add_to_cart", {
              "af_content_id": 'id123',
              "af_currency": 'USD',
              "af_revenue": '2',
            }),
        buttonText: "log event",
        kbURL:
            "https://github.com/AppsFlyerSDK/appsflyer-flutter-plugin/blob/master/doc/API.md#logEvent",
        alertText: "Event logged",
        alertTitle: "log event");
  }

  Widget getStopBtn() {
    return ApiButton(
        onPressed: () {
          setState(() {
            AFStopManager.getInstance().changeStopState();
          });
        },
        buttonText:
            "${!AFStopManager.getInstance().stop ? "OPT In" : "OPT Out"}",
        kbURL:
            "https://github.com/AppsFlyerSDK/appsflyer-flutter-plugin/blob/master/doc/API.md#stop",
        alertText:
            "You atr now ${AFStopManager.getInstance().stop ? "OPT in" : "OPT out"}",
        alertTitle: "Stop()");
  }
  Widget getAppsFlyerIdBtn() {
    return ApiButton(
        onPressed: () {
          setState(() {
            _appsflyerSdk.getAppsFlyerUID().then((value) => _afId = value);
          });
        },
        buttonText:
        "get AppsFlyer UID",
        kbURL:
        "https://github.com/AppsFlyerSDK/appsflyer-flutter-plugin/blob/master/doc/API.md#getAppsFlyerUID",
        alertText:
        "AppsFlyer ID = ${_afId??"empty"}",
        alertTitle: "AppsFlyer ID");
  }




}
