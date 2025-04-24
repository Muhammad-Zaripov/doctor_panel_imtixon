import 'package:exam_3/views/nav_bar/main_page_view.dart';
import 'package:exam_3/views/nav_bar/profil_view.dart';
import 'package:exam_3/views/nav_bar/settings_view.dart';
import 'package:exam_3/views/nav_bar/submissions_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pages = [
      MainPageView(),
      SubmissionsView(),
      ProfilView(),
      SettingsView(),
    ];
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: selectedIndex, children: pages),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        
        selectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        unselectedItemColor: isDark ? Colors.white : Colors.grey.shade800,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blueGrey),
            label: 'Bosh sahifa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mark_chat_unread_rounded, color: Colors.blueGrey),
            label: 'Xabarlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blueGrey),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.blueGrey),
            label: 'Sozlanmalar',
          ),
        ],
      ),
    );
  }
}
