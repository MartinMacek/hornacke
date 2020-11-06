import 'package:flutter/material.dart';
import 'package:hornacke/screens/home-screen.dart';
import 'package:hornacke/screens/search-screen.dart';
import 'package:hornacke/screens/submit-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horňácké',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: "Metropolis",
        /*pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),*/
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => HomePage(),
        '/search': (context) => SearchPage(),
        '/submit': (context) => SubmitPage(),
      },
    );
  }
}
