import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  static const routeName = '/page2';
  String title = "page2";

  Page2({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(
          child: Text(this.title),
        ),
      ),
    );
  }
}
