import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hornacke/components/detail-appbar.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SubmitPage extends StatefulWidget {
  @override
  _SubmitPageState createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  String _songType;
  String _errMessage = "";
  bool sending = false;

  TextEditingController titleController = TextEditingController();
  TextEditingController originController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  final smtpServer = new SmtpServer('smtp.seznam.cz',
      username: 'hornacke@seznam.cz',
      password: 'Xhornacke12',
      port: 465,
      allowInsecure: true);

  Future<bool> validation() async {
    if (titleController.text.isEmpty) {
      setState(() {
        _errMessage = "Prosím vyplněte Název písně";
      });
      return false;
    } else if (_songType == null) {
      setState(() {
        _errMessage = "Prosím vyberte Typ písně";
      });
      return false;
    } else if (textController.text.isEmpty) {
      setState(() {
        _errMessage = "Prosím vyplněte Text písně";
      });
      return false;
    }
    setState(() {
      _errMessage = "";
    });
    return true;
  }

  void submitNewSong() async {
    if (await validation() == false) {
      return;
    }
    setState(() {
      sending = true;
    });
    final message = Message()
      ..from = Address('hornacke@seznam.cz', 'Hornacke')
      ..recipients.add('martin.m53@seznam.cz')
      ..subject =
          'Test Dart Mailer library :: 😀 :: ${DateTime.now().toLocal()}'
      ..text = 'Title: ${titleController.text}\n'
          'Origin: ${originController.text}\n'
          'Type: ${_songType}\n\n'
          'Date: ${dateController.text}\n\n'
          'Author: ${authorController.text}\n\n'
          'Text: ${textController.text}\n\n'
          'Link: ${linkController.text}\n\n'
          'Comment: ${commentController.text}\n';
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      setState(() {
        sending = false;
      });
    } on MailerException catch (e) {
      print('Message not sent.');
      print.toString();
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
      setState(() {
        sending = false;
      });
    }
  }

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
                            "Veškeré příspěvky jsou schvalovány ručně pro zachování ucelenosti, předcházení chybám nebo duplicitním příspěvkům. "
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
                controller: titleController,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                      controller: originController,
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
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 3, bottom: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.grey)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: _songType,
                          icon: Icon(Icons.keyboard_arrow_down),
                          hint: Text("Typ *",
                              style: TextStyle(fontFamily: "Times")),
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "Verbuňk",
                                style: TextStyle(fontFamily: "Times"),
                              ),
                              value: "VERBUNK",
                            ),
                            DropdownMenuItem(
                              child: Text("Sedlácká",
                                  style: TextStyle(fontFamily: "Times")),
                              value: "SEDLACKA",
                            ),
                            DropdownMenuItem(
                              child: Text("Táhlá",
                                  style: TextStyle(fontFamily: "Times")),
                              value: "SEDLACKA-TAHLA",
                            ),
                            DropdownMenuItem(
                              child: Text("Milostná",
                                  style: TextStyle(fontFamily: "Times")),
                              value: "SEDLACKA-MILOSTNA",
                            ),
                            DropdownMenuItem(
                              child: Text("Vojenská",
                                  style: TextStyle(fontFamily: "Times")),
                              value: "SEDLACKA-VOJENSKA",
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _songType = value;
                            });
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                      controller: dateController,
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
                controller: authorController,
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
                controller: textController,
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
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    hintText: 'např. https://youtu.be/djV11Xbc914...',
                    labelText: 'Odkaz na youtube video',
                    labelStyle:
                        TextStyle(fontFamily: "Times", color: Colors.black))),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: commentController,
                minLines: 2,
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText:
                        'Zajímavost, jiná verze, okolnosti, historie, doplňující informace...',
                    labelText: 'Doplňující komentář',
                    labelStyle:
                        TextStyle(fontFamily: "Times", color: Colors.black))),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pole s * jsou povinné",
              style: TextStyle(color: Colors.black, fontFamily: "Times"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              _errMessage.toString(),
              style: TextStyle(color: Colors.red, fontFamily: "Times"),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                height: 56,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    !sending
                        ? Text(
                            "Odeslat",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: "Times"),
                          )
                        : Container(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator())
                  ],
                ),
                color: Color(0xff191919),
                onPressed: sending ? null : submitNewSong),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ))),
    );
  }
}
