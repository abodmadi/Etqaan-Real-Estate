import 'package:etqaan_real_estate/controllers/location_controller.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_flutter_map.dart';
import 'package:etqaan_real_estate/widgets/custom_map_marker.dart';
import 'package:etqaan_real_estate/widgets/custom_sliding_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ProjectsMapPage extends StatelessWidget {
  ProjectsMapPage({super.key});

  MapController mapController = MapController();

  final PanelController panelController = PanelController();

  late List<Marker> foundMarkers;

  // this is showing the item marker in map:
  List<Marker> createMarkers(List foundLocation, bool zoomLevel) {
    foundMarkers = [];
    foundLocation.forEach(
      (element) {
        foundMarkers.add(
          CustomMapMarker(
            zoomLevel: zoomLevel,
            lat: double.parse(element.lat),
            long: double.parse(element.long),
            title: element.name,
          ).buildMarker(),
        );
      },
    );
    return foundMarkers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LocationController>(
        builder: (locationController) {
          return SlidingUpPanel(
            controller: panelController,
            minHeight: Dimensions.screenHeight * 0.1,
            maxHeight: Dimensions.screenHeight * 0.8,
            parallaxEnabled: true,
            defaultPanelState: PanelState.CLOSED,
            parallaxOffset: 0.5,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20),
            ),
            body: CustomFlutterMap(
              mapController: mapController,
              foundedMarkers: createMarkers(
                locationController.foundLocationsList,
                (locationController.zoomLevel >= 16),
              ),
            ),
            panelBuilder: (sc) {
              return CustomSlidingPanel(
                isLoaded: locationController.isLoaded,
                panelController: panelController,
                scrollController: sc,
                foundLocationItems: locationController.foundLocationsList,
              );
            },
          );
        },
      ),
    );
  }
}
