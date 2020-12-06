import 'package:flutter/material.dart';
import 'editData.dart';
import 'package:http/http.dart' as http;
import 'kesehatan.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.list, this.index});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deletedata() {
    var url = "http://192.168.1.5/finalproject/deleteData.php";
    http.post(url,
        body: {'id_catatan': widget.list[widget.index]['id_catatan']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "apakah anda yakin hapus ini?'${widget.list[widget.index]['catatan']}'"),
      actions: [
        new RaisedButton(
          child: new Text(
            'Ok Delete',
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deletedata();
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Kesehatan()));
          },
        ),
        new RaisedButton(
            child: new Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
            color: Colors.green,
            onPressed: () => Navigator.pop(context))
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['catatan']}"),
        backgroundColor: Colors.green,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(10.0),
            height: 500.0,
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        new Padding(padding: const EdgeInsets.only(top: 30.0)),
                        new Text(
                          widget.list[widget.index]['catatan'],
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 30.0)),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new RaisedButton(
                              child: new Text('Edit'),
                              color: Colors.deepOrangeAccent,
                              onPressed: () => Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                builder: (BuildContext context) => new EditData(
                                    list: widget.list, index: widget.index),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                            ),
                            new RaisedButton(
                                child: new Text('Delete'),
                                color: Colors.blue,
                                onPressed: () => confirm())
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
