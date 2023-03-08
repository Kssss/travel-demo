import 'package:flutter/material.dart';

import 'app/home_page.dart';
import 'app/search_page.dart';
import 'app/mine_page.dart';
import 'app/travle_page.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  late int _currentIndex;
  late List<Widget> _pages;
  late PageController _controller;

  @override
  void initState() {
    super.initState();

    _currentIndex = 0;
    _pages = [
      const HomePage(),
      const SearchPage(),
      const TravelPage(),
      const MinePage(),
    ];
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  void _onTap(int index) {
    print("_onTap-$index");
    if (_currentIndex == 3 && index != 3) {
      // Navigator.pop(context);
    }

    _controller.jumpToPage(index);
  }

  void _onPageChange(int index) {
    print("_onPageChange-$index");
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTap,
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        itemCount: _pages.length,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        onPageChanged: _onPageChange,
      ),
      backgroundColor: const Color(0xfff2f2f2),
    );
  }

  final List<BottomNavigationBarItem> bottomNavItems = [
    const BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      icon: Icon(Icons.home),
      label: "首页",
    ),    
    const BottomNavigationBarItem(
      backgroundColor: Colors.green,
      icon: Icon(Icons.search),
      label: "搜索",
    ),
    const BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      icon: Icon(Icons.photo),
      label: "旅拍",
    ),
    const BottomNavigationBarItem(
      backgroundColor: Colors.red,
      icon: Icon(Icons.person),
      label: "我的",
    ),
  ];
}
