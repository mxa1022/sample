import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecondPageState createState() {
    return _SecondPageState();
  }
}

//class _SecondPageState extends State<SecondPage> with AutomaticKeepAliveClientMixin<SecondPage>{
class _SecondPageState extends State<SecondPage> {
  var _count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Text("This is SecondPage: $_count"),
          ),
          color: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _count++;
            });
          },
          child: new Text("Add"),
        ));
  }

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

//  @override
//  // TODO: implement wantKeepAlive
//  bool get wantKeepAlive => true;
}
