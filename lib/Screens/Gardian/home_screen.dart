import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shcool/Screens/Gardian/G_HomePage.dart';
import 'package:shcool/Screens/Teacher/T_HomePage.dart';
import 'package:shcool/Screens/setting.dart';

class Home extends StatefulWidget {
  final String role;

  Home({super.key, required this.role});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  final items = <Widget>[
    Icon(Icons.home, size: 30),
    Icon(Icons.settings, size: 30),
  ];

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    if (widget.role == 'Student') {
      _pages = [
        GHomepage(),
        
        Setting(),
      ];
    } else if (widget.role == 'Teacher') {
      _pages = [
        THomepage(),
        Setting(),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color(0xff8CB0FF),
        height: 60,
        items: items,
        index: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: _pages[selectedIndex],
    );
  }
}
