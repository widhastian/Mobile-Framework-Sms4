import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:from_css_color/from_css_color.dart';
import 'package:project_sms4/page/artikel_page.dart';
import 'package:project_sms4/page/dashboard_page.dart';
import 'package:project_sms4/page/profile_page.dart';
import 'package:project_sms4/page/profile_page2.dart';

class navBottom extends StatefulWidget {
  const navBottom({Key? key}) : super(key: key);

  @override
  _navBottomState createState() => _navBottomState();
}

class _navBottomState extends State<navBottom> {
  int currentTab = 0;
  final List<Widget> screens = [Dashboard(), Artikel(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentTab,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.getFont('Poppins'),
        selectedItemColor: fromCssColor('#6AA83F'),
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: currentTab,
        onTap: (index) => setState(() => currentTab = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_rounded),
            label: 'Artikel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
