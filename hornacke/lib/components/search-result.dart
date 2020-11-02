import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  SearchResult(this.title, this.lyrics, this.keyword);

  final String title;
  final String lyrics;
  final String keyword;

  @override
  Widget build(BuildContext context) {
    var titleArray = title.split(keyword);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          title.contains(keyword)
              ? Row(
                  children: [
                    Text(
                      titleArray.first,
                      style: TextStyle(fontFamily: "Times", fontSize: 18.0),
                    ),
                    Text(
                      keyword,
                      style: TextStyle(
                          backgroundColor: Colors.black,
                          color: Colors.white,
                          fontFamily: "Times",
                          fontSize: 18.0),
                    ),
                    Text(
                      titleArray.last,
                      style: TextStyle(fontFamily: "Times", fontSize: 18.0),
                    ),
                  ],
                )
              : Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontFamily: "Times", fontSize: 18.0),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
