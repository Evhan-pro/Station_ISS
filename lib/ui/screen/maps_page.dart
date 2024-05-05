import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'iss_service.dart'; // Assurez-vous que le chemin d'importation est correct

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final LatLng _initialPosition = const LatLng(0, 0);
  GoogleMapController? _controller;
  Marker? _issMarker;
  final IssService _issService = IssService();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (timer) => _fetchISSPosition());
  }

  Future<void> _fetchISSPosition() async {
    try {
      final issPosition = await _issService.fetchIssPosition();
      _loadMarkerImage(issPosition);
    } catch (e) {
      debugPrint('Error fetching ISS position: $e');
    }
  }

  Future<void> _loadMarkerImage(LatLng position) async {
    try {
      final BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), 'assets/images/stationiss.png');
      _updateISSMarker(position, icon);
    } catch (e) {
      debugPrint('Failed to load marker icon: $e');
    }
  }

  void _updateISSMarker(LatLng position, BitmapDescriptor icon) {
    setState(() {
      _issMarker = Marker(
        markerId: const MarkerId('iss'),
        position: position,
        icon: icon,
      );
    });
    _controller?.moveCamera(CameraUpdate.newLatLng(position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 4.0,
        ),
        markers: _issMarker != null ? {_issMarker!} : {},
        mapType: MapType.satellite,
      ),
    );
  }
}
