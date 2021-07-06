import 'dart:io' show Platform;

import 'package:af_flutter_demo/pages/laoding_page.dart';
import 'package:af_flutter_demo/utils/json_format.dart';
import 'package:af_flutter_demo/widgets/callback_text_view.dart';
import 'package:af_flutter_demo/widgets/my_scaffold.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppsflyerSdk? _appsflyerSdk;
  String _gcd = "";
  String _deepLink = "";

  @override
  void initState() {
    super.initState();
    Map appsFlyerOptions = {
      "afDevKey": "4ux8wjmC9qP6qc3UWZ5Ldh",
      "afAppId": "1534996322",
      "isDebug": true
    };

    _appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

    _registerOnDeepLink();
    _registerOnConversionData();
    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _appsflyerSdk?.initSdk(
          registerConversionDataCallback: true,
          registerOnDeepLinkingCallback: true),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          _updateToken();
          return MyScaffold(body: getBody(), pageTitle: "home page");
        } else {
          return LoadingPage();
        }
        //return Container();
      },
    );
  }

  Widget getBody() {
    return Column(
      children: [
        CallBackTextView(
          title: "GCD",
          content: _gcd,
        ),
        CallBackTextView(
          title: "Deep link",
          content: _deepLink,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(15),
            child: ElevatedButton(
                onPressed: () => openApiPage(context),
                child: Text("API Page"))),
      ],
    );
  }

  void _registerOnDeepLink() {
    _appsflyerSdk?.onDeepLinking((dp) {
      setState(() {
        _deepLink = JSONFormat.prettyJson(dp, indent: 4);
      });
    });
  }

  void _registerOnConversionData() {
    _appsflyerSdk?.onInstallConversionData((gcd) {
      // Navigator.of(this.context).pushNamed("/api");

      print("gcd= $gcd");
      setState(() {
        _gcd = JSONFormat.prettyJson(gcd, indent: 4);
      });
    });
  }

  void openApiPage(BuildContext context) {
    Navigator.of(context).pushNamed("/api");
  }

  ///update Uninstall Token
  void _updateToken() {
    if (Platform.isAndroid) {
      FirebaseMessaging.instance.getToken().then((token) => token != null
          ? _appsflyerSdk?.updateServerUninstallToken(token)
          : null);
    } else if (Platform.isIOS) {
      FirebaseMessaging.instance.getAPNSToken().then((token) => token != null
          ? _appsflyerSdk?.updateServerUninstallToken(token)
          : null);
    }
  }

  /// request permission for ios
  Future<void> _requestPermission() async {
    if (Platform.isIOS) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    }
  }
}
