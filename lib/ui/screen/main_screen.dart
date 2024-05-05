import 'package:flutter/material.dart';
import 'package:suivi_iss/ui/screen/satellite_page.dart';
import 'package:suivi_iss/ui/screen/maps_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    });
  }

  Future<void> _toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
    await prefs.setBool('isDarkTheme', _isDarkTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        extendBody: true, // S'étend derrière la barre de navigation en bas
        appBar: AppBar(
          title: Text('Suivi ISS'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: _selectedIndex == 0 ? MapsPage() : SatellitePage(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleTheme,
          child: Icon(_isDarkTheme ? Icons.wb_sunny : Icons.nights_stay),
        ),
        bottomNavigationBar: buildBottomNavBar(),
      ),
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
          backgroundColor: Colors.grey[200], // Légèrement transparent
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 5,
        ),
      ),
    );
  }
}
