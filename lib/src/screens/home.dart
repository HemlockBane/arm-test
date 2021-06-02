import 'package:arm_test/src/screens/posts.dart';
import 'package:flutter/material.dart';

import 'articles.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = 'home';
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;

  final tabs = [
    PostsScreen(),
    ArticlesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabs[_currentTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTabIndex,
          onTap: _changeTab,
          items: [
            BottomNavigationBarItem(
                label: "Posts", icon: Icon(Icons.post_add_rounded)),
            BottomNavigationBarItem(
                label: "Articles", icon: Icon(Icons.article))
          ],
        ),
      ),
    );
  }

  void _changeTab(int nextTabIndex) {
    setState(() {
      _currentTabIndex = nextTabIndex;
    });
  }
}
