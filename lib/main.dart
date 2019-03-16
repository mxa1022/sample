import 'package:flutter/material.dart';
import 'package:sample/navigation/FirstPage.dart';
import 'package:sample/navigation/SecondPage.dart';
import 'package:sample/navigation/ThirdPage.dart';
import 'package:sample/navigation/FourthPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<MyHomePage> {
  int _currentIndex = 0;

//  var _pageController = PageController();
  var _pageList = new List<StatefulWidget>();
  var _titles = new List<String>();

  void _pageChange(int index) {
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _titles.add("Page 1");
    _titles.add("Page 2");
    _titles.add("Page 3");
    _titles.add("Page 4");
    _pageList.add(FirstPage());
    _pageList.add(SecondPage());
    _pageList.add(ThirdPage());
    _pageList.add(FourthPage());
  }

  @override
  Widget build(BuildContext context) {
    // Stack + TickerMode 方式
//    return new Scaffold(
//      body: Stack(children: <Widget>[
//        _makePage(0),
//        _makePage(1),
//        _makePage(2),
//        _makePage(3),
//      ]),
//      bottomNavigationBar: _getNavigationBar(),
//    );

    // IndexStack 方式
    return new Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pageList),
      bottomNavigationBar: _getNavigationBar(),
    );

    // PageView 方式
//    return new Scaffold(
//        body: PageView.builder(
//            controller: _pageController,
//            itemCount: _pageList.length,
//            onPageChanged: (int index) {
//              _pageChange(index);
//            },
//            itemBuilder: (BuildContext context, int index) {
//              return _pageList[index];
//            }),
//        bottomNavigationBar: _getNavigationBar());
  }

  /*
   * Stack 方式创建页面
   */
  Widget _makePage(int index) {
    return Offstage(
        offstage: this._currentIndex != index,
        child: TickerMode(
            enabled: this._currentIndex == index, child: _pageList[index]));
  }

  /*
   * 创建底部导航栏
   */
  BottomNavigationBar _getNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color: Colors.grey,
            ),
            title: Text(
              _titles[0],
              style: new TextStyle(
                  color: _currentIndex == 0 ? Colors.blueAccent : Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
            activeIcon: Icon(
              Icons.explore,
            ),
            backgroundColor: Colors.transparent),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.fiber_new,
              color: Colors.grey,
            ),
            title: Text(
              _titles[1],
              style: TextStyle(
                  color: _currentIndex == 1 ? Colors.blueAccent : Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
            activeIcon: Icon(
              Icons.fiber_new,
//                color: Colors.blue,
            ),
            backgroundColor: Colors.transparent),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.slow_motion_video,
              color: Colors.grey,
            ),
            title: Text(
              _titles[2],
              style: new TextStyle(
                  color: _currentIndex == 2 ? Colors.blueAccent : Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
            activeIcon: Icon(
              Icons.slow_motion_video,
//                color: Colors.blue,
            ),
            backgroundColor: Colors.transparent),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.beach_access,
              color: Colors.grey,
            ),
            title: Text(
              _titles[3],
              style: new TextStyle(
                  color: _currentIndex == 3 ? Colors.blueAccent : Colors.grey,
                  fontWeight: FontWeight.normal),
            ),
            activeIcon: Icon(
              Icons.beach_access,
//                color: Colors.blue,
            ),
            backgroundColor: Colors.transparent)
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      iconSize: 24.0,
      onTap: (int index) {
        //页面跳转，PageView 方式
//        _pageController.jumpToPage(
//          index,
//        );
        // 底部导航栏状态转换
        _pageChange(index);
      },
      fixedColor: Colors.blueAccent,
    );
  }
}
