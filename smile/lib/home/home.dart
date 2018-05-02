import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  PageController _pageController;
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: new PageView(
          children: <Widget>[
            new Container(color: Colors.amber),
            new Container(color: Colors.cyan),
            new Container(color: Colors.deepOrange),
          ],
          controller: _pageController,
          onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.graphic_eq),
              title: new Text("Graphs"),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: new Text("Home"),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: new Text("Settings"),
            ),
          ],
          onTap: (pageNum) {
            _pageController.animateToPage(
              pageNum,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          currentIndex: _currentPage,
        ),
      ),
    );
  }

  void _onPageChanged(int pageNum) {
    setState(() {
      this._currentPage = pageNum;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
