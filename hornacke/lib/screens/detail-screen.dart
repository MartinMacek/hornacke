import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hornacke/components/detail-appbar.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen(
      {this.title,
      this.lyrics,
      this.author,
      this.type,
      this.origin,
      this.created,
      this.video,
      this.sound});

  final String title;
  final String lyrics;
  final String author;
  final String type;
  final String origin;
  final String created;
  final String video;
  final String sound;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DetailAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/hudba.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 193,
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          title != null ? title : "Název",
                          style: TextStyle(fontSize: 36.0, fontFamily: "Times"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          author != null ? author : "Autor neznámý",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: SvgPicture.asset(
                            "assets/images/text-icon.svg",
                            height: 16,
                          ),
                        ),
                        if (sound != null && sound.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: SvgPicture.asset(
                              "assets/images/sound-icon.svg",
                              height: 16,
                            ),
                          ),
                        if (video != null && video.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: SvgPicture.asset(
                              "assets/images/video-icon.svg",
                              height: 16,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Původ",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              origin != null ? origin : "Neznámý",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Typ",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              type != null ? type : "Neuvedeno",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Vznik",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                            Text(
                              created != null ? created : "Neznámý",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.black,
                                width: 3.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              "Text",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Html(
                            style: {
                              "html": Style(
                                fontSize: FontSize(18),
                              ),
                              "body": Style(margin: EdgeInsets.all(0)),
                            },
                            data: lyrics != null ? lyrics : "Text písně",
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    if(sound != null && sound.isNotEmpty)
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black,
                                    width: 3.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  "Zvuk",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(sound.toString()),
                        SizedBox(
                          height: 45,
                        ),
                      ],
                    ),

                    if (video != null && video.isNotEmpty)
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                  width: 3.0,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: Text(
                                "Video",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),

                    SizedBox(
                      height: 20,
                    ),

                    video != null &&
                            video.isNotEmpty &&
                            video.contains("https://youtu.be/")
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Html(
                                shrinkWrap: true,
                                style: {
                                  "html": Style(
                                    fontSize: FontSize(18),
                                  ),
                                  'body': Style(margin: EdgeInsets.all(0)),
                                },
                                data:
                                    '<iframe allowFullScreen="allowFullScreen" src="https://www.youtube.com/embed/${video.split("https://youtu.be/")[1]}?ecver=1&amp;iv_load_policy=1&amp;rel=0&amp;yt:stretch=16:9&amp;autohide=1&amp;color=red&amp;width=560&amp;width=560" width="560" height="315" allowtransparency="true" frameborder="0"><script type="text/javascript">function execute_YTvideo(){return youtube.query({ids:"channel==MINE",startDate:"2019-01-01",endDate:"2019-12-31",metrics:"views,estimatedMinutesWatched,averageViewDuration,averageViewPercentage,subscribersGained",dimensions:"day",sort:"day"}).then(function(e){},function(e){console.error("Execute error",e)})}</script></iframe>',
                              ),
                            ],
                          )
                        : Text(video.toString()),
                    SizedBox(
                      height: 45,
                    ),
                    //VideoPlayerBox(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
