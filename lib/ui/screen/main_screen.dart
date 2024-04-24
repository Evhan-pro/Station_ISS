import 'package:flutter/material.dart';
import 'package:suivi_iss/ui/screen/satellite_page.dart';

import 'package:suivi_iss/ui/screen/maps_page.dart';

import '../home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selectedIndex == 0 ? const MapsPage() : SatellitePage(),
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBottomNavBar() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Maps',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.satellite),
              label: 'Satellite',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey[500],
          onTap: _onItemTapped,
          backgroundColor: Colors.grey[200],
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 5,
        ),
      ),
    );
  }
}
