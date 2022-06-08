import 'package:flutter/material.dart';
import 'package:project_sms4/page/dashboard_page.dart';
import 'package:project_sms4/page/artikel_page.dart';
import 'package:project_sms4/page/profile_page.dart';

class NavigasiButtonPage extends StatefulWidget {
  // const NavigasiButtonPage({ Key? key }) : super(key: key);

  @override
  _NavigasiButtonPageState createState() => _NavigasiButtonPageState();
}

class _NavigasiButtonPageState extends State<NavigasiButtonPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new Dashboard(),
    new Artikel(),
    new ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[_bottomNavCurrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF6AA83F),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _bottomNavCurrentIndex = index;
          });
        },
        currentIndex: _bottomNavCurrentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.home,
              color: Color(0xFF6AA83F),
            ),
            icon:  new Icon(
              Icons.home,
              color: Color(0xFF6AA83F),
            ),
            label: 'Dasboard',
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.article,
              color: Color(0xFF6AA83F),
            ),
            icon:  new Icon(
              Icons.article,
              color: Color(0xFF6AA83F),
            ),
            label: 'Artikel',
          ),
          BottomNavigationBarItem(
            activeIcon: new Icon(
              Icons.account_circle,
              color: Color(0xFF6AA83F),
            ),
            icon: new Icon(
              Icons.account_circle,
              color: Color(0xFF6AA83F),
            ),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
