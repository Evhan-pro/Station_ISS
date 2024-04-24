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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
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
            const Padding(
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "FAQ sur la Station Spatiale Internationale",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            ...buildFAQs(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildFAQs() {
    return [
      const ExpansionTile(
        title: Text("Comment les astronautes vivent-ils dans l'ISS?"),
        children: [
          ListTile(
            title: Text("Les astronautes vivent dans des conditions de microgravité, ce qui requiert des adaptations spéciales pour dormir, manger et faire de l'exercice."),
          )
        ],
      ),
      const ExpansionTile(
        title: Text("Quels types de recherches sont menés sur l'ISS?"),
        children: [
          ListTile(
            title: Text("L'ISS sert de laboratoire pour la recherche scientifique dans les domaines de la biologie, la physique, l'astronomie et d'autres sciences."),
          )
        ],
      ),
      const ExpansionTile(
        title: Text("Combien de personnes peuvent vivre sur l'ISS?"),
        children: [
          ListTile(
            title: Text("L'ISS peut accueillir un équipage permanent de six personnes, avec la capacité d'accueillir jusqu'à dix personnes pendant les changements d'équipage ou les visites spéciales."),
          )
        ],
      ),
      const ExpansionTile(
        title: Text("Quelle est la durée d'une mission sur l'ISS?"),
        children: [
          ListTile(
            title: Text("La durée moyenne d'une mission sur l'ISS est d'environ six mois. Toutefois, certains astronautes restent pour des missions plus longues ou plus courtes, selon les besoins de la mission."),
          )
        ],
      ),
      const ExpansionTile(
        title: Text("Comment l'ISS est-elle ravitaillée?"),
        children: [
          ListTile(
            title: Text("L'ISS est régulièrement ravitaillée par des vaisseaux non habités lancés depuis la Terre. Ces vaisseaux transportent nourriture, expériences scientifiques, pièces de rechange et d'autres fournitures essentielles."),
          )
        ],
      ),
    ];
  }
}
