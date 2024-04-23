import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class SatellitePage extends StatefulWidget {
  const SatellitePage({super.key});

  @override
  _SatellitePageState createState() => _SatellitePageState();
}

class _SatellitePageState extends State<SatellitePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: ModelViewer(
                src: 'assets/models/ISS_stationary.glb',
                iosSrc: 'assets/models/ISS_stationary.glb',
                arModes: ['scene-viewer', 'quick-look'],
                alt: "Modèle de la Station Spatiale Internationale",
                ar: false,
                autoRotate: true,
                disableZoom: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "La Station Spatiale Internationale (ISS) est un habitacle "
                    "spatial habité en orbite basse terrestre. C'est un projet de "
                    "coopération internationale qui regroupe plusieurs agences "
                    "spatiales: NASA, Roscosmos, JAXA, ESA, et CSA. L'ISS sert de "
                    "microgravité et de laboratoire de recherche en environnement "
                    "spatial où sont menées des recherches scientifiques dans "
                    "divers domaines.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
