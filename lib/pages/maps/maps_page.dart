import 'package:etqaan_real_estate/controllers/location_controller.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:etqaan_real_estate/widgets/custom_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();

  //var map =FlutterMap(options: , children: children)
}

class _MapPageState extends State<MapPage> {
  MapController _mapController = MapController();
  List<Marker> createMarkers(List foundLocation, bool zoomLevel) {
    List<Marker> foundMarkers = [];
    foundLocation.forEach(
      (element) {
        foundMarkers.add(
          zoomLevel
              ? Marker(
                  width: 60,
                  height: 30,
                  point: LatLng(
                      double.parse(element.lat), double.parse(element.long)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10 - 9,
                      vertical: Dimensions.height10 - 9,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                    ),
                    child: Center(
                      child: CustomBigText(
                        text: '450K',
                        textColor: Colors.white,
                        fontSize: Dimensions.fontSize12,
                      ),
                    ),
                  ),
                )
              : Marker(
                  point: LatLng(
                      double.parse(element.lat), double.parse(element.long)),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 2,
                  ),
                ),
        );
      },
    );
    return foundMarkers;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('المشاريع'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_rounded),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: Dimensions.screenHeight * 0.6,
              //color: Colors.amber,
              child: GetBuilder<LocationController>(
                builder: (locationController) {
                  print(
                      "zomm Level " + locationController.zoomLevel.toString());
                  return FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      onPointerDown: (event, point) {},
                      initialCenter:
                          LatLng(29.974145087508784, 30.944395904564544),
                      initialZoom: 16,
                      onMapEvent: (event) {
                        if (event is MapEventMoveEnd) {
                          print("mapController is:" +
                              _mapController!.camera.center.toString());
                          locationController.findLocations(lanLong: [
                            _mapController!.camera.center.latitude,
                            _mapController!.camera.center.longitude
                          ]);
                        }
                        if (event is MapEventScrollWheelZoom) {
                          print("zoooom is:" +
                              _mapController.camera.zoom.toString());
                          locationController
                              .updateZomLevel(_mapController!.camera.zoom);
                        }
                      },
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                        subdomains: ['a', 'b', 'c'],
                        userAgentPackageName: 'Etqaan Real Estate',
                      ),
                      MarkerLayer(
                        markers: createMarkers(
                            locationController.foundLocationsList,
                            (locationController.zoomLevel >= 16.0)),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: Dimensions.screenHeight * 0.06,
            ),
            GetBuilder<LocationController>(builder: (locationController) {
              return Container(
                width: double.maxFinite,
                height: Dimensions.screenHeight * 0.3,
                child: ListView.builder(
                  itemCount: locationController.foundLocationsList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      //width: 100,
                      //height: 100,
                      decoration: BoxDecoration(
                        //color: Colors.red,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.1,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(AppConstants.BASE_URL +
                                    locationController
                                        .foundLocationsList[index].marker!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          CustomSmallText(
                              text: locationController
                                  .foundLocationsList[index].name!),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}


/*
Marker(
                            width: 200,
                            height: 60,
                            point:
                                LatLng(29.966350091737134, 30.95153832416266),
                            child: Container(
                              padding: EdgeInsets.only(
                                left: Dimensions.width10 - 5,
                                right: Dimensions.width10 - 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        top: Dimensions.height10 - 5,
                                        bottom: Dimensions.height10 - 5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius10),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  '/uploads/images/33.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10 - 5,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: CustomSmallText(
                                      text: "مستشفى الصفوة",
                                      maxLines: 1,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ) 
*/