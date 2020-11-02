import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hornacke/screens/detail-screen.dart';

class SongCard extends StatelessWidget {
  SongCard(this.title, this.lyrics, this.type, {this.video, this.sound});

  final String title;
  final String lyrics;
  final String type;
  final String video;
  final String sound;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: new BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xff202023).withOpacity(.1),
              blurRadius: 70.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                10.0, // Move to right 10  horizontally
                10.0, // Move to bottom 10 Vertically
              ),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () => {
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
            )
          },
          child: Material(
              borderRadius: BorderRadius.circular(10.0),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          type.toUpperCase(),
                          style: TextStyle(
                              fontSize: 12.0, color: Color(0xff838383)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontFamily: "Times", fontSize: 18.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Html(
                            style: {
                              "html": Style(
                                fontSize: FontSize(12),
                              ),
                              "body": Style(margin: EdgeInsets.all(0)),
                            },
                            data: lyrics != null
                                ? lyrics.substring(0, 90) + "..."
                                : "Text písně",
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/text-icon.svg"),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "Text",
                              style: TextStyle(fontSize: 11),
                            ),
                            SizedBox(
                              width: 18.0,
                            ),
                          ],
                        ),
                        if (sound != null && sound.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/sound-icon.svg"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Zvuk",
                                style: TextStyle(fontSize: 11),
                              ),
                              SizedBox(
                                width: 18.0,
                              ),
                            ],
                          ),
                        if (video != null && video.isNotEmpty)
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/video-icon.svg"),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Video",
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
