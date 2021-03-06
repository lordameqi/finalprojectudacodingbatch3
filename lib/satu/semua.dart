import 'package:flutter/material.dart';
import 'satu.dart';
import 'dua.dart';

class Semua extends StatefulWidget {
  @override
  _SemuaState createState() => _SemuaState();
}

class _SemuaState extends State<Semua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finance'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: <Widget>[
                Text("Informasi Kesehatan satu"),
                FlatButton(
                  color: Color.fromRGBO(161, 108, 164, 1.0),
                  child: const Text('Read Article'),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => Satu()));
                  },
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: <Widget>[
                Text("Informasi Kesehatan kedua"),
                FlatButton(
                  color: Color.fromRGBO(161, 108, 164, 1.0),
                  child: const Text('Read Article'),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) => Dua()));
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
