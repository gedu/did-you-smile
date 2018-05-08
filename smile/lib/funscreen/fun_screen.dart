import 'package:flutter/material.dart';

import 'package:smile/common/resource/widget_style.dart';
import '../common/assets_path.dart';

class FunScreen extends StatefulWidget {

  String _motivationalMessage = "I will prepare for my moment";

  @override
  State<StatefulWidget> createState() => _FunScreenState();
}

class _FunScreenState extends State<FunScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            _buildHeader(),
            _buildFunPicture(),
            _buildCenter()
          ],
        ),
      ],
    );
  }

  Padding _buildHeader() {
    return Padding(
            padding: new EdgeInsets.only(top: 48.0),
            child: Text(widget._motivationalMessage, style: home_header,),
          );
  }

  Expanded _buildFunPicture() {
    return Expanded(
            child: Image.asset(fake_pic),
          );
  }

  Center _buildCenter() {
    return Center(
              child: Padding(
                padding: new EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton.extended(
                  icon: Icon(Icons.refresh),
                  label: Text("Refresh"),
                  onPressed: () {},
                ),
              )
          );
  }

}