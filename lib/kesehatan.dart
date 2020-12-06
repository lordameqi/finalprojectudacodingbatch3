import 'dart:convert';
import 'AddData.dart';
import 'detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Kesehatan extends StatefulWidget {
  @override
  _KesehatanState createState() => _KesehatanState();
}

class _KesehatanState extends State<Kesehatan> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.1.5/finalproject/getData.php");
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Data Catatan'),
        backgroundColor: Colors.blueAccent,
      ),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => null));
          }),
      body: new FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ? new ItemList(
                    list: snapshot.data,
                  )
                : new Center(
                    child: new CircularProgressIndicator(),
                  );
          }),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Detail(list: list, index: i)));
            },
            child: new Card(
              color: Colors.white,
              child: new ListTile(
                title: new Text(list[i]['catatan']),
                leading: new Icon(Icons.list),
              ),
            ),
          ),
        );
      },
    );
  }
}
