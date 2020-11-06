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
      body: Text("submit screen"),
    );
  }
}
