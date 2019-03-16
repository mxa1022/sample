import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ThirdPageState createState() {
    return _ThirdPageState();
  }
}

//class _ThirdPageState extends State<ThirdPage> with AutomaticKeepAliveClientMixin<ThirdPage>{
class _ThirdPageState extends State<ThirdPage> {
  var _count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Text("This is ThirdPage: $_count"),
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
