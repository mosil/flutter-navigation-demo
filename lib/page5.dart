import 'package:flutter/material.dart';

import 'models/page_arguments.dart';

class Page5 extends StatelessWidget {
  static const routeName = '/page5';

  @override
  Widget build(BuildContext context) {
    final PageArguments args = ModalRoute.of(context).settings.arguments;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Center(
          child: Text(args.title),
        ),
      ),
    );
  }
}
