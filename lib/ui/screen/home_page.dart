import 'package:flutter/material.dart';
import 'package:suivi_iss/ui/screen/maps_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MapsPage()),
            );
          },
          child: Text('Find Space Station '),
        ),
      ),
    );
  }
}
