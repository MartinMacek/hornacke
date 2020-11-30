import 'package:flutter/material.dart';
import 'package:hornacke/components/detail-appbar.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController textController = TextEditingController();
  bool sending = false;

  void submitFeedback() {
    setState(() {
      sending = true;
    });

    setState(() {
      sending = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Navrhnout úpravu',
              style: TextStyle(fontFamily: 'Times', fontSize: 36.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Máte návrh na vylepšení aplikace? Objevila se někde chyba? Nění některý obsah v pořádku? \nZde máte možnost vyslovit nápady na zlepšení, úpravy, případně vyjádřit svůj názor.",
              style: TextStyle(),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
                controller: textController,
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Text...',
                    labelText: 'Váš komentář',
                    labelStyle:
                        TextStyle(fontFamily: "Times", color: Colors.black))),
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
                onPressed: sending ? null : submitFeedback),
          ],
        ),
      ),
    );
  }
}
