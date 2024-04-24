import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final LatLng _initialPosition =
      const LatLng(0, 0); // Position initiale de la carte
  GoogleMapController? _controller;
  Marker? _issMarker;

  @override
  void initState() {
    super.initState();
    _fetchISSPosition();
    Timer.periodic(const Duration(seconds: 1), (timer) => _fetchISSPosition());
  }

  Future<void> _fetchISSPosition() async {
    try {
      final response =
          await http.get(Uri.parse('http://api.open-notify.org/iss-now.json'));
      final data = jsonDecode(response.body);
      final issPosition = LatLng(
        double.parse(data['iss_position']['latitude']),
        double.parse(data['iss_position']['longitude']),
      );
      _updateISSMarker(issPosition);
    } catch (e) {
      debugPrint('Error fetching ISS position: $e');
    }
  }

  void _updateISSMarker(LatLng position) {
    setState(() {
      _issMarker = Marker(
        markerId: const MarkerId('iss'),
        position: position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      );
    });
    _controller?.moveCamera(CameraUpdate.newLatLng(position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live ISS Tracker'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 4.0,
        ),
        markers: {_issMarker!},
        mapType: MapType.satellite,
      ),
    );
  }
}
