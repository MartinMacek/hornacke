import 'package:flutter/material.dart';
import 'package:hornacke/components/custom-appbar.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191919),
      appBar: CustomAppBar(
        closable: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                child: Text(
                  "Všechny písně",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
              TextButton(
                child: Text(
                  "Vyhledat",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).pushNamed("/search");
                },
              ),
              TextButton(
                child: Text(
                  "Přidat píseň",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).pushNamed("/submit");
                },
              ),
              TextButton(
                child: Text(
                  "Navrhnout úpravu",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).pushNamed("/feedback");
                },
              ),
              TextButton(
                child: Text(
                  "O aplikaci",
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).pushNamed("/about");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
