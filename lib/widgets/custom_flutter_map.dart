import 'package:etqaan_real_estate/controllers/location_controller.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class CustomFlutterMap extends StatelessWidget {
  final MapController mapController;
  final List<Marker> foundedMarkers;
  final String apiKey = 'QX1UWWz27hBAFnA0HOcULsrG3xEcVVTo';
  const CustomFlutterMap({
    super.key,
    required this.mapController,
    required this.foundedMarkers,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        onPointerDown: (event, point) {},
        initialCenter: LatLng(
          AppConstants.INITIAL_LATITUDE,
          AppConstants.INITIAL_LONGITUDE,
        ),
        initialZoom: 16,
        onMapEvent: (event) {
          if (event is MapEventMoveEnd) {
            print("mapController is:" + mapController.camera.center.toString());
            Get.find<LocationController>().findLocations(lanLong: [
              mapController.camera.center.latitude,
              mapController.camera.center.longitude
            ]);
          }
          // In this function the rebuild not work :
          /*if (event is MapEventScrollWheelZoom) {
            print("zoooom is:" + mapController.camera.zoom.toString());
            Get.find<LocationController>()
                .updateZomLevel(mapController.camera.zoom);
          }*/
        },
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
          markers: foundedMarkers,
        ),
      ],
    );
  }
}
