import 'package:flutter/material.dart';
import 'package:suivi_iss/ui/home_page.dart';
import 'package:suivi_iss/ui/screen/maps_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'IssOrbit',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


