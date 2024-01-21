import 'package:latlong2/latlong.dart';

import '../../models/location.dart';

class LocationService {
  List<Location> locations = [
    Location.active(
        "Fevziçakmak",
        "Fevzi Çakmak, Sakarya Cd. No:156, 35330 Balçova/İzmir",
        "24",
        "Cable2",
        "24",
        LatLng(38.423734, 27.142826)),
    Location(
        "ESARJ",
        "Mavişehir, Caher Dudayev Blv No:40/B, 35590 Karşıyaka/İzmir",
        "25",
        "Cable2",
        "24",
        LatLng(38.443, 27.139)),
    Location(
        "ZES Station",
        "Swissotel İzmir DC, Alsancak, Gazi Osman Paşa Blv. No 1, 35210 Konak/İzmir",
        "32",
        "Tesla Supercharger",
        "40",
        LatLng(38.391, 27.119)),
    Location("GIO Station", "Çetin Emeç, Kıvanç Sk No:14, 35330 Balçova/İzmir",
        "20", "CHAdeMO ", "30", LatLng(38.391, 27.179)),
    Location("Ottowatt", "Atakent, 2035. Sk. No:36, 35590 Karşıyaka/İzmir",
        "27", "Level2", "20", LatLng(40.391, 27.2179)),
  ];
}
