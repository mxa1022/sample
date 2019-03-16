import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  FourthPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FourthPageState createState() {
    return _FourthPageState();
  }
}

//class _FourthPageState extends State<FourthPage> with AutomaticKeepAliveClientMixin<FourthPage>{
class _FourthPageState extends State<FourthPage> {
  var _count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Text("This is FourthPage: $_count"),
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
