import 'package:af_flutter_demo/widgets/api_button.dart';
import 'package:flutter/material.dart';

class CallBackTextView extends StatelessWidget {
  final String title;
  final String content;

  const CallBackTextView({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getTitle(),
          SizedBox(
            height: 10,
          ),
          getContent(),

        ],
      ),
    );
  }

  Widget getTitle() {
    return Center(
      child: Text(
        title,
        style: TextStyle(fontSize: 30.0),
      ),
    );
  }

  Widget getContent() {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      child: Text(
        content,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
