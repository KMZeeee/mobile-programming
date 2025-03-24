import 'package:flutter/material.dart';
import 'package:to_do/pages/task_page.dart';
import 'package:to_do/pages/note_page.dart';

class NavState extends StatefulWidget {
  const NavState({super.key});

  @override
  State<NavState> createState() => _NavStateState();
}

class _NavStateState extends State<NavState> {
  int _selectedIndex = 0;

  final List<Widget> _screen = <Widget>[TaskPage(), NotePage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF222831),
        selectedIconTheme: IconThemeData(size: 30),
        selectedItemColor: Color(0xFFFFD369),
        unselectedIconTheme: IconThemeData(size: 20),
        unselectedItemColor: Color(0xFFEEEEEE),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.task_alt), label: 'Task'),
          BottomNavigationBarItem(icon: Icon(Icons.note_alt), label: 'Notes'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
