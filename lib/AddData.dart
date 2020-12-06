import 'dart:async';
import 'dart:io';
import 'kesehatan.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController catatanController = new TextEditingController();

  void addData() {
    var url = "http://192.168.1.5/finalproject/addData.php";
    http.post(url, body: {"catatan": catatanController.text});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Add Catatan"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new TextField(
                  controller: catatanController,
                  decoration: new InputDecoration(
                    hintText: "Input Catatan Anda",
                    labelText: "Catatan",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                new RaisedButton(
                    child: new Text("Tambah Data"),
                    color: Colors.green,
                    onPressed: () {
                      addData();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Kesehatan()));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
