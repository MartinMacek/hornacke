import 'package:flutter/material.dart';
import 'package:hornacke/components/detail-appbar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/zvonica.png"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 41.0, vertical: 12.0),
              child: Hero(
                tag: "search",
                child: Material(
                  child: TextField(
                    autocorrect: false,
                    autofocus: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54, width: 1.0),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Vyhledat...',
                        suffixIcon: Icon(Icons.search_outlined)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
