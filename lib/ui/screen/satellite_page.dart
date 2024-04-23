import 'package:flutter/material.dart';

class SatellitePage extends StatefulWidget {
  const SatellitePage({super.key});

  @override
  _SatellitePageState createState() => _SatellitePageState();
}

class _SatellitePageState extends State<SatellitePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Satellite Page'),
      ),
    );
  }
}
