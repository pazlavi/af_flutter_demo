import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final String kbURL;
  final String alertText;
  final String alertTitle;

  const ApiButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      required this.kbURL,
      required this.alertText,
      required this.alertTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ElevatedButton(
          onPressed: () => _onClick(context),
          child: Text(buttonText),
        ));
  }

  void _onClick(BuildContext context) async {
    await onPressed();
    _openDialog(context);
  }

  void _openDialog(BuildContext context) async {
    return showDialog(
        useSafeArea: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            scrollable: true,
            title: Text(alertTitle),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(alertText),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: Text('dismiss'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: Text('open documentation'),
                onPressed: () {
                  _launchURL(kbURL);
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
