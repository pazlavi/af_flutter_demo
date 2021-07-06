import 'package:af_flutter_demo/widgets/my_scaffold.dart';
import 'package:flutter/material.dart';
class DeepLinkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(body: getBody(), pageTitle: "Deep link page");
  }

  Widget getBody() {
    return Center(
      child: Text("You Deep linked into this page"),
    );
  }
}
