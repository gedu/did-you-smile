import 'package:flutter/material.dart';

import '../funscreen/fun_screen.dart';
import '../graph/graph_screen.dart';

import '../common/widget_key.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  PageController _pageController;
  int _currentPage;

  int get currentPage => _currentPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _currentPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          children: <Widget>[
            GraphScreen(),
            FunScreen(),
            Container(color: Colors.deepOrange),
          ],
          controller: _pageController,
          onPageChanged: _onPageChanged,
        ),
        bottomNavigationBar: BottomNavigationBar(
          key: Key(bottomNavigationKey),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.graphic_eq),
              title: Text("Graphs"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
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
