import 'package:flutter/material.dart';
import 'package:hornacke/components/custom-appbar.dart';
import 'package:hornacke/screens/search-screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
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
                  ),
                  height: 262,
                ),
                SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 41.0),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
