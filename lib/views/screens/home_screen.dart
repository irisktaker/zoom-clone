import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/views/screens/contact_screen.dart';
import 'package:zoom_clone/views/screens/history_screen.dart';
import 'package:zoom_clone/views/screens/meeting_screen.dart';
import 'package:zoom_clone/views/screens/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final pages = [
    const MeetingScreen(),
    const HistoryScreen(),
    const ContactScreen(),
    const SettingsScreen(),
  ];

  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.comment_bank),
      label: 'Meet & Chat',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.lock_clock),
      label: 'Meeting',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Contacts',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_pageIndex],
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Meet & Chat"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: items,
        currentIndex: _pageIndex,
        onTap: (index) => setState(
          () => _pageIndex = index,
        ),
      ),
    );
  }
}
