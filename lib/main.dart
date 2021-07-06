import 'package:af_flutter_demo/pages/api_page.dart';
import 'package:af_flutter_demo/pages/deep_link_page.dart';
import 'package:af_flutter_demo/pages/home_page.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/":(context) =>HomePage(),
        "/api":(context) =>APIPage(),
        "/dp":(context) =>DeepLinkPage(),

      },
    );
  }
}

