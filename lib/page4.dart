import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  static const routeName = '/page4';
  final String title;

  Page4({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
