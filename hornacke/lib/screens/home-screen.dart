import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hornacke/components/custom-appbar.dart';
import 'package:hornacke/components/song-card.dart';
import 'package:hornacke/models/song-model.dart';
import 'package:hornacke/screens/search-screen.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future futureSongs;

  List<Song> parseSongs(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Song>((json) => Song.fromJson(json)).toList();
  }
  // sedlacke - https://hornacke.8u.cz/wp-json/wp/v2/songs?filter[meta_key]=song_type&filter[meta_value]=sedlacka
  // verbunky - https://hornacke.8u.cz/wp-json/wp/v2/songs?filter[meta_key]=song_type&filter[meta_value]=verbunk

  Future<List<Song>> fetchSongs() async {
    final response =
        await http.get("https://hornacke.8u.cz/wp-json/wp/v2/songs");

    if (response.statusCode == 200) {
      return parseSongs(response.body);
    } else {
      throw Exception('Failed to load songs');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureSongs = fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(44.0)),
              color: Color(0xff191919),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/mlyn.png"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(color: Color(0xff191919), width: 2)),
                  ),
                  height: 262,
                ),
                SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 41.0),
                  child: Hero(
                    tag: "search",
                    child: OutlineButton(
                        padding: const EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 24,
                            ),
                            Text("Vyhledat písničku"),
                            Icon(Icons.search_outlined)
                          ],
                        ),
                        textColor: Colors.white,
                        borderSide: BorderSide(color: Colors.white, width: 1),
                        onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return SearchPage();
                                }),
                              )
                            }),
                  ),
                ),
                SizedBox(
                  height: 43,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Text(
                      "Nejnovější písně",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Text(
                      "Sedlácké",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Row(
                  children: [
                    Text(
                      "Další...",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17,
                ),
                /*Column(
                  children: List.generate(
                      0, (i) => SongCard("The title", "lyrics", "sedlacka")),
                ),*/
                FutureBuilder(
                  future: futureSongs,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          primary: false,
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return SongCard(
                              snapshot.data[index].title,
                              snapshot.data[index].lyrics,
                              snapshot.data[index].type,
                              sound: null,
                              video: snapshot.data[index].video,
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text("err: ${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


