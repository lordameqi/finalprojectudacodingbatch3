import 'package:flutter/material.dart';

class Dua extends StatefulWidget {
  @override
  _DuaState createState() => _DuaState();
}

class _DuaState extends State<Dua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Kesehatan Dua'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Text("Informasi Kesehatan Dua"),
            SizedBox(
              height: 8.0,
            ),
            Text("ini isinya loh")
          ],
        ),
      ),
    );
  }
}
