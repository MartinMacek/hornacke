import 'package:flutter/material.dart';
import 'package:hornacke/components/detail-appbar.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DetailAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'O aplikaci',
                style: TextStyle(fontFamily: 'Times', fontSize: 36.0),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Zde můžete přispět do této digitání sbírky horňáckých písní a podělit se tak s ostatními o cenné kulturní dědictví. ",
                style: TextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Zde můžete přispět do této digitání sbírky horňáckých písní a podělit se tak s ostatními o cenné kulturní dědictví. ",
                style: TextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Zde můžete přispět do této digitání sbírky horňáckých písní a podělit se tak s ostatními o cenné kulturní dědictví. ",
                style: TextStyle(),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Zde můžete přispět do této digitání sbírky horňáckých písní a podělit se tak s ostatními o cenné kulturní dědictví. ",
                style: TextStyle(),
              ),
            ],
          ),
        ));
  }
}
