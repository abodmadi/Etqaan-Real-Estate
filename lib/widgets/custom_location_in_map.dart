import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomLocationInMap extends StatelessWidget {
  final MapController mapController;
  final LatLng latLng;
  final List<Marker> marker;
  final String apiKey = 'QX1UWWz27hBAFnA0HOcULsrG3xEcVVTo';
  const CustomLocationInMap({
    super.key,
    required this.mapController,
    required this.latLng,
    required this.marker,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: latLng,
        initialZoom: 16,
      ),
      children: [
        TileLayer(
          /*urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'Etqaan Real Estate',*/
          urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
              "{z}/{x}/{y}.png?key={apiKey}",
          additionalOptions: {"apiKey": apiKey},
        ),
        MarkerLayer(
          markers: marker,
        ),
      ],
    );
  }
}
