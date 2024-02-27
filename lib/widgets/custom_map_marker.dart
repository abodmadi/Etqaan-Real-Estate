import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMapMarker {
  final bool zoomLevel;
  final String title;
  final double lat;
  final double long;
  const CustomMapMarker({
    required this.zoomLevel,
    required this.lat,
    required this.long,
    required this.title,
  });

  buildMarker() {
    return Marker(
      width: 100,
      height: 40,
      point: LatLng(lat, long),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.mainIconColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.maps_home_work_rounded,
                color: Colors.white,
              ),
              SizedBox(
                width: Dimensions.width10 - 5,
              ),
              CustomSmallText(
                text: "460K",
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
    /*: Marker(
            point: LatLng(lat, long),
            child: CircleAvatar(
              backgroundColor: AppColors.mainIconColor,
              radius: 2,
            ),
          );*/
  }
}
