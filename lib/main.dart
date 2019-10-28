import 'package:flutter/material.dart';
import 'package:flutter_navigation/page2.dart';
import 'package:flutter_navigation/page3.dart';
import 'package:flutter_navigation/page4.dart';
import 'package:flutter_navigation/page5.dart';

import 'models/page_arguments.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// define the routes by providing additional properties to the MaterialApp constructor: the initialRoute and the routes themselves.
    ///
    /// The initialRoute property defines which route the app should start with. The routes property defines the available named routes and the widgets to build when navigating to those routes.
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(title: "Home"),
        Page3.routeName: (context) => Page3(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Page4.routeName) {
          // 請注意，這一頁不能同時定義在 routes 裡，設定會優先採用 routes。
          // Notice: this page can't setting into routes, that would call setting of routes first.
          final PageArguments args = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return Page4(
              title: args.title,
            );
          });
        }
        return null;
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            getPushRouteButton(),
            getPushNamedRouteButton(),
            getPushNamedWithArgsRouteButton(context),
            getPushRouteWithArgsButton(context),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }

  /// https://flutter.dev/docs/cookbook/navigation/navigation-basics
  /// To switch to a new route, use the Navigator.push() method.
  /// The push() method adds a Route to the stack of routes managed by the Navigator.
  /// Where does the Route come from? You can create your own, or use a MaterialPageRoute,
  /// which is useful because it transitions to the new route using a platform-specific animation.
  getPushRouteButton() {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Page2(title: "MainToPage2"),
          ),
        );
      },
      child: Text("Use Push Route"),
    );
  }

  /// https://flutter.dev/docs/cookbook/navigation/named-routes
  /// With the widgets and routes in place, trigger navigation by using the Navigator.pushNamed() method.
  /// This tells Flutter to build the widget defined in the routes table and launch the screen.
  getPushNamedRouteButton() {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, "/page3");
      },
      child: Text("Use Named Route"),
    );
  }

  getPushNamedWithArgsRouteButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          Page4.routeName,
          arguments: PageArguments("MainToPage4"),
        );
      },
      child: Text("Use Push Route for argument of settings"),
    );
  }

  getPushRouteWithArgsButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Page5(),
            settings: RouteSettings(
              arguments: PageArguments("MainToPage5"),
            ),
          ),
        );
      },
      child: Text("Use Push Route for argument of settings"),
    );
  }
}
