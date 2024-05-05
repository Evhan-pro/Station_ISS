import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class IssService {
  Future<LatLng> fetchIssPosition() async {
    try {
      final response =
          await http.get(Uri.parse('http://api.open-notify.org/iss-now.json'));
      final data = jsonDecode(response.body);
      return LatLng(
        double.parse(data['iss_position']['latitude']),
        double.parse(data['iss_position']['longitude']),
      );
    } catch (e) {
      throw Exception('Failed to load ISS position: $e');
    }
  }
}
