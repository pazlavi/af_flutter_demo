import 'package:af_flutter_demo/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(body: getBody(), pageTitle: "AppsFlyer");
  }

  Widget getBody() {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
          strokeWidth: 5.0,

        ),
      ),
    );
  }
}
