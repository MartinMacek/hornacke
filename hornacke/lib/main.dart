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
        theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: "Metropolis"
        ),
        home: Navigator(
          pages: [
            MaterialPage(key: ValueKey("HomePage"), child: HomePage()),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }

            return true;
          },
        ));
  }
}
