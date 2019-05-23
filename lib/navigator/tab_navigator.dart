import 'package:flutter/material.dart';
import 'package:ctrip/pages/home_page.dart';
import 'package:ctrip/pages/my_page.dart';
import 'package:ctrip/pages/search_page.dart';
import 'package:ctrip/pages/travel_page.dart';

class TabNavigator extends StatefulWidget{
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>{
  final PageController _controller = PageController(
    initialPage: 0,
  );
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        onPageChanged: _pageChange,
        controller: _controller,
        children: <Widget>[
          HomePage(),
          SearchPage(),
          TravelPage(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index){
            _controller.jumpToPage(index);
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomItem('首页',Icons.home,0),
            _bottomItem('搜索',Icons.search,1),
            _bottomItem('旅拍',Icons.camera_alt,2),
            _bottomItem('我的',Icons.account_circle,3),
      ]),//BottomNavigationBar
    );//Scaffold
  }

  _bottomItem(String title,IconData iconData,int index){
    return BottomNavigationBarItem(
        icon: Icon(iconData,size:48.0, color: _defaultColor),
        activeIcon: Icon(iconData,size:48.0, color: _activeColor),
        title: Text(title,style: TextStyle(
          color:_currentIndex!=index?_defaultColor:_activeColor,
          fontSize: 24,
        ),
        )
      );

  }

  void _pageChange(int index) {
    setState(() {
      if(_currentIndex !=index){
        _currentIndex = index;
      }
    });
  }
}