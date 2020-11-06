import 'package:flutter/material.dart';
import 'package:hornacke/screens/detail-screen.dart';

class SearchResult extends StatelessWidget {
  SearchResult(this.title, this.lyrics, this.keyword,
      {this.video, this.sound, this.type});

  final String title;
  final String lyrics;
  final String keyword;
  final String video;
  final String sound;
  final String type;

  @override
  Widget build(BuildContext context) {
    var titleArray = title.split(keyword);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return DetailScreen(
              title: title,
              lyrics: lyrics,
              video: video,
              sound: sound,
              type: type,
            );
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Row(
          children: [
            title.contains(keyword)
                ? Expanded(
                    child: RichText(
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        text: TextSpan(
                            text: titleArray.first,
                            style: TextStyle(
                                fontFamily: "Times",
                                fontSize: 18.0,
                                color: Colors.black),
                            children: <InlineSpan>[
                              TextSpan(
                                text: keyword,
                                style: TextStyle(
                                    backgroundColor: Colors.black,
                                    color: Colors.white,
                                    fontFamily: "Times",
                                    fontSize: 18.0),
                              ),
                              TextSpan(
                                text: titleArray.last,
                                style: TextStyle(
                                    fontFamily: "Times",
                                    fontSize: 18.0,
                                    color: Colors.black),
                              )
                            ])),
                  )
                : Row(
                    children: [
                      Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontFamily: "Times", fontSize: 18.0),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
