import 'package:epasys_app/shared/theme.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Text('Home'),
    const Text('History'),
    const Text('QR'),
    const Text('Vechile'),
    const Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text('Epasys'),
      ),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          unselectedItemColor: const Color(0xff526480),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ic_home.png',
                width: 24,
              ),
              activeIcon: Image.asset(
                'assets/images/ic_home_active.png',
                width: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ic_history.png',
                width: 24,
              ),
              activeIcon: Image.asset(
                'assets/images/ic_history_active.png',
                width: 24,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/img_scan.png',
                width: 46,
              ),
              label: 'Scan QR',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ic_vechile.png',
                width: 24,
              ),
              activeIcon: Image.asset(
                'assets/images/ic_vechile_active.png',
                width: 24,
              ),
              label: 'Vechile',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/images/ic_profile.png',
                width: 24,
              ),
              activeIcon: Image.asset(
                'assets/images/ic_profile_active.png',
                width: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
