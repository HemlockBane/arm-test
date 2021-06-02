import 'package:arm_test/src/screens/posts.dart';
import 'package:arm_test/src/services/firestore_service.dart';
import 'package:flutter/material.dart';

import 'articles.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  HomeScreen({required this.user});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;
  User user = User.empty();

  List<Widget> tabs = [];

  @override
  void initState() {
    super.initState();
    user = widget.user;
    tabs.addAll([
      PostsScreen(
        user: user,
      ),
      ArticlesScreen(),
    ]);
  }

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
