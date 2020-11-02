import 'package:flutter/material.dart';
import 'package:hornacke/screens/home-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horňácké',
      theme: ThemeData(primarySwatch: Colors.grey, fontFamily: "Metropolis"),
      initialRoute: "/",
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomePage(),
      },
    );
  }
}
