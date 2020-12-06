import 'package:flutter/material.dart';
import 'kesehatan.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list, this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController catatanController;

  void editData() {
    var url = "http://192.168.1.5/finalproject/editData.php";
    http.post(url, body: {
      "id_catatan": widget.list[widget.index]['id_catatan'],
      "catatan": catatanController.text
    });
  }

  @override
  void initState() {
    catatanController =
        new TextEditingController(text: widget.list[widget.index]['catatan']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Edit Data Catatan'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new TextField(
                  controller: catatanController,
                  decoration: new InputDecoration(
                      hintText: "Input catatan",
                      labelText: "Catatan",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 15.0),
                ),
                new RaisedButton(
                    child: new Text("Edit data"),
                    color: Colors.blueAccent,
                    onPressed: () {
                      editData();
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
