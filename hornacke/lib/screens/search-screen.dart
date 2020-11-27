import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hornacke/components/debouncer.dart';
import 'package:hornacke/components/detail-appbar.dart';
import 'package:hornacke/components/search-result.dart';
import 'package:hornacke/models/song-model.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // search filter - https://hornacke.8u.cz/wp-json/wp/v2/songs?filter[meta_key]=lyrics&filter[meta_compare]=LIKE&filter[meta_value]=martin

  List<Song> futureSongs;
  String _keyword;
  bool searching = false;

  final _controller = TextEditingController();

  final _debouncer = Debouncer(milliseconds: 1000);

  List<Song> parseSongs(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Song>((json) => Song.fromJson(json)).toList();
  }

  void fetchSongs(String keyword) async {
    print("new request");
    setState(() {
      futureSongs = null;
      searching = true;
    });

    if (keyword == null || keyword.length < 3) {
      setState(() {
        _keyword = null;
        searching = false;
      });
      return;
    }

    final response = await http.get(
        "https://hornacke.8u.cz/wp-json/wp/v2/songs?filter[meta_key]=lyrics&filter[meta_compare]=LIKE&filter[meta_value]=$keyword&per_page=10");

    setState(() {
      searching = false;
    });

    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        _keyword = keyword;
        futureSongs = parseSongs(response.body);
      });
    } else {
      throw Exception('Failed to load songs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/zvonica.png"),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 41.0, vertical: 12.0),
              child: Hero(
                tag: "search",
                child: Material(
                  child: TextField(
                    autocorrect: false,
                    autofocus: true,
                    controller: _controller,
                    onSubmitted: (val) {
                      _debouncer.run(() => fetchSongs(val));
                    },
                    onChanged: (val) {
                      _debouncer.run(() => fetchSongs(val));
                    },
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black54, width: 1.0),
                            borderRadius: BorderRadius.circular(8)),
                        hintText: 'Vyhledat slovo...',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search_outlined),
                          onPressed: () {
                            _debouncer.run(() => fetchSongs(_controller.text));
                          },
                        )),
                  ),
                ),
              ),
            ),
            if (futureSongs != null &&
                futureSongs.isNotEmpty &&
                futureSongs.length > 0)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: futureSongs
                          .map((val) => SearchResult(
                                val.title,
                                val.lyrics,
                                _keyword,
                                video: val.video,
                                sound: null,
                                type: val.type,
                              ))
                          .toList(),
                    ),
                  ),
                ),
              )
            else if (searching && futureSongs == null)
              CircularProgressIndicator()
            else if (_keyword != null && _keyword.isNotEmpty)
              Text("Žádný výsledek"),
          ],
        ),
      ),
    );
  }
}
