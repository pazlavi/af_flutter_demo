import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyScaffold extends StatelessWidget {
  final String pageTitle;
  final Widget body;

  const MyScaffold({Key? key, required this.body, required this.pageTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(pageTitle),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getAppsFlyerImage(),
          SizedBox(height: 15.0,),
          body
        ],
      ),
    );
  }

  Widget getAppsFlyerImage() {
    return SvgPicture.asset(
        'assets/AF_logo.svg',
        fit: BoxFit.fill,
        //color: Colors.blue,
       // semanticsLabel: 'AF logo'
    );
  }
}
