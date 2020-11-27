import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hornacke/components/detail-appbar.dart';

class SubmitPage extends StatefulWidget {
  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Přidat novou píseň',
              style: TextStyle(fontFamily: 'Times', fontSize: 36.0),
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
            Material(
              elevation: 2,
              child: ExpandablePanel(
                header: Padding(
                  padding: const EdgeInsets.only(top: 13.0, left: 16.0),
                  child: Text(
                    "Jak to funguje?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                expanded: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 4.0),
                      child: Column(
                        children: [
                          Text(
                            "Je to snadné. Stačí co nejlépe vyplnit informace o písničce kterou chcete přidat a stisknout tlačítko odeslat. \n"
                            "Veškeré příspěvky jsou schvalovány ručně pro zachování celistvosti, předcházení chybám nebo duplicitním příspěvkům. "
                            "Přidání proto může trvat, může být lehce poupraveno či se do databáze nedostat vůbec. "
                            "Nenechte se tím však odradit! \nZa každý příspěvek jsem velmi rád a předem Vám velmi děkuji, že jste ochotni rozšiřovat tuto digitální sbírku :)",
                            softWrap: true,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Katerinko staň hore...',
                    labelText: 'Název písně *',
                    labelStyle:
                        TextStyle(fontFamily: "Times", color: Colors.black))),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: 'oblast/obec',
                          labelText: 'Původ',
                          labelStyle: TextStyle(
                              fontFamily: "Times", color: Colors.black))),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: 'select',
                          labelText: 'Typ *',
                          labelStyle: TextStyle(
                              fontFamily: "Times", color: Colors.black))),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: '~ rok',
                          labelText: 'Vznik',
                          labelStyle: TextStyle(
                              fontFamily: "Times", color: Colors.black))),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Jméno, (rok)',
                    labelText: 'Autor',
                    labelStyle:
                        TextStyle(fontFamily: "Times", color: Colors.black))),
            SizedBox(
              height: 20,
            ),
            TextField(
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Text písně...',
                    labelText: 'Text *',
                    labelStyle:
                        TextStyle(fontFamily: "Times", color: Colors.black))),
            SizedBox(
              height: 20,
            ),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'např. https://youtu.be/djV11Xbc914...',
                    labelText: 'Odkaz na youtube video',
                    labelStyle:
                        TextStyle(fontFamily: "Times", color: Colors.black))),
            SizedBox(
              height: 40,
            ),
            MaterialButton(
                height: 56,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Odeslat",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: "Times"),
                    ),
                  ],
                ),
                color: Color(0xff191919),
                onPressed: () {}),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ))),
    );
  }
}
