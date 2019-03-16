import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FirstPageState createState() {
    return _FirstPageState();
  }
}

//class _FirstPageState extends State<FirstPage> with AutomaticKeepAliveClientMixin<FirstPage>{
class _FirstPageState extends State<FirstPage> {
  var _count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Text("This is FirstPage: $_count"),
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
