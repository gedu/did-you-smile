import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import '../datasource/file_data_source.dart';

class GraphScreen extends StatefulWidget {

  FileDataSource _fileDataSource;

  String _savedText = "";

  @override
  State<StatefulWidget> createState() => GraphScreenState();
}

class GraphScreenState extends State<GraphScreen> {

  String _text = "";

  @override
  void initState() {
    super.initState();
    widget._fileDataSource = new FileDataSource();
    widget._fileDataSource.loadJson().then((String currentContent) {
      setState(() {
        widget._savedText = currentContent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amberAccent,
      padding: new EdgeInsets.only(top: 32.0),
      child: Column(children: <Widget>[
        TextField(decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Write data to save into file",
        ), onSubmitted: (text) {
          _text = text;
        },),
        Text(widget._savedText),
        RaisedButton(onPressed:(){
          widget._fileDataSource.saveJson(_text).then((File file) {

          });
        },
          child: Text("Save"),)
      ],),);
  }

}
