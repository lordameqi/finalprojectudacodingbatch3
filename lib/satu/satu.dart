import 'package:flutter/material.dart';

class Satu extends StatefulWidget {
  @override
  _SatuState createState() => _SatuState();
}

class _SatuState extends State<Satu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Kesehatan Satu'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Text("Informasi Kesehatan Satu"),
            SizedBox(
              height: 8.0,
            ),
            Text("ini isinya")
          ],
        ),
      ),
    );
  }
}
