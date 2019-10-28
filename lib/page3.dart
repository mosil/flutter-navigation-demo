import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  static const routeName = '/page3';
  String title = "page3";

  Page3();

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
