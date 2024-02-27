import 'package:etqaan_real_estate/controllers/location_controller.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:etqaan_real_estate/widgets/custom_expandable_text.dart';
import 'package:etqaan_real_estate/widgets/custom_location_in_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ProjectDetailsPage extends StatelessWidget {
  final int projectID;
  ProjectDetailsPage({
    super.key,
    required this.projectID,
  });
  int curntIndex = 0;
  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    List foundLocationsList = Get.find<LocationController>().foundLocationsList;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // this is showing the project list of images:
                Container(
                  width: double.maxFinite,
                  height: Dimensions.screenHeight * 0.4,
                  //margin: EdgeInsets.only(bottom: Dimensions.marginH10),
                  child: Hero(
                    tag: projectID,
                    transitionOnUserGestures: true,
                    // this is showing the selected image:
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(AppConstants.BASE_URL +
                              foundLocationsList[projectID].marker),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // this is showing the list to select a image from it:
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.maxFinite,
                              height: Dimensions.height30 * 3,
                              //color: Colors.green,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.all(5),
                                    width: Dimensions.width20 * 5,
                                    height: Dimensions.height20 * 3,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            AppConstants.BASE_URL +
                                                foundLocationsList[projectID]
                                                    .marker),
                                        fit: BoxFit.cover,
                                      ),
                                      border: index == curntIndex
                                          ? Border.all(
                                              style: BorderStyle.solid,
                                              width: 2.0,
                                              color: AppColors.mainIconColor,
                                            )
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // this is showing the body of details(text and porshore):
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // this is showing the project title:
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Dimensions.marginH20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomBigText(
                            text: foundLocationsList[projectID].name,
                            fontSize: Dimensions.fontSize16,
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.mainIconColor,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // this is showing the project description:
                    CustomBigText(text: "وصف المشروع:"),
                    CustomExpandableText(
                      text:
                          'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Ullam cum quas delectus ex hic! Minima numquam quia qui. Ut, culpa molestias. Repellendus, et quasi, vero velit explicabo in, neque nesciunt aut laudantium facilis illo necessitatibus. Esse id maiores harum cum iure fuga quae, magni voluptate nemo facere qui ducimus sit laudantium fugit, laborum asperiores quas nobis at. Debitis cupiditate placeat eaque aperiam similique facilis! Quod pariatur perspiciatis praesentium quia. Corrupti architecto ipsa animi aliquam reiciendis quidem repellendus ex temporibus aspernatur velit fuga, dolor totam atque laborum fugit iste optio earum sapiente excepturi deleniti numquam voluptates impedit! Expedita enim ut eaque.',
                      textHeight: Dimensions.height20 * 7,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Divider(
                      color: AppColors.mainIconColor,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    // this is showing the status and porshor button:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: AppColors.mainIconColor,
                              width: 1.0,
                            ),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.paddingH10,
                            horizontal: Dimensions.paddingH20,
                          ),
                          child: Center(
                            child: CustomBigText(
                              text: 'متوفر',
                              textColor: Colors.green,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: AppColors.mainIconColor,
                              width: 1.0,
                            ),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.paddingH10,
                            horizontal: Dimensions.paddingH20,
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                CustomBigText(text: 'البورشور'),
                                SizedBox(width: Dimensions.width10),
                                Icon(
                                  FontAwesomeIcons.solidFilePdf,
                                  size: 30,
                                  color: Color(0xffb30b00),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*SizedBox(
                      width: double.maxFinite,
                      height: Dimensions.height30 * 2,
                      //color: Colors.amber,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: AppColors.mainIconColor,
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.paddingH10,
                              horizontal: Dimensions.paddingH20,
                            ),
                            child: Center(
                              child: CustomBigText(
                                text: 'عمارة',
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: AppColors.mainIconColor,
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.paddingH10,
                              horizontal: Dimensions.paddingH20,
                            ),
                            child: Center(
                              child: CustomBigText(
                                text: 'للبيع',
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: AppColors.mainIconColor,
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.paddingH10,
                              horizontal: Dimensions.paddingH20,
                            ),
                            child: Center(
                              child: CustomBigText(
                                text: 'متوفر',
                                textColor: Colors.green,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: AppColors.mainIconColor,
                                width: 1.0,
                              ),
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: Dimensions.paddingH10,
                              horizontal: Dimensions.paddingH20,
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  CustomBigText(text: 'البورشور'),
                                  SizedBox(width: Dimensions.width10),
                                  Icon(
                                    FontAwesomeIcons.solidFilePdf,
                                    size: 30,
                                    color: Color(0xffb30b00),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),*/
                    // This is showing the project location on the map:
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    Divider(
                      color: AppColors.mainIconColor,
                      thickness: 1,
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    CustomBigText(text: "الموقع على الخريطة"),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    /*Container(
                      width: double.maxFinite,
                      height: Dimensions.height30 * 10,
                      //color: AppColors.mainIconColor,
                      child: CustomLocationInMap(
                        mapController: mapController,
                        latLng: LatLng(
                            double.parse(foundLocationsList[projectID].lat),
                            double.parse(foundLocationsList[projectID].long)),
                        marker: [
                          Marker(
                            point: LatLng(
                                double.parse(foundLocationsList[projectID].lat),
                                double.parse(
                                    foundLocationsList[projectID].long)),
                            child: Icon(
                              Icons.location_pin,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: Dimensions.paddingH10,
          left: Dimensions.paddingH20 - 5,
          right: Dimensions.paddingH20 - 5,
          bottom: Dimensions.paddingH10,
        ),
        height: (Dimensions.height30 + 20) * 2,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Dimensions.radius20,
            ),
            topRight: Radius.circular(
              Dimensions.radius20,
            ),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(
            left: Dimensions.marginH10,
            right: Dimensions.marginH10,
          ),
          //color: Colors.red,
          child: Row(
            children: [
              Container(
                width: Dimensions.width30 * 2,
                height: Dimensions.height30 * 2,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.mainIconColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Icon(
                  CupertinoIcons.archivebox,
                  color: AppColors.mainIconColor,
                ),
              ),
              SizedBox(
                width: Dimensions.height20,
              ),
              Expanded(
                child: Container(
                  width: Dimensions.width30 * 2,
                  height: Dimensions.height30 * 2,
                  decoration: BoxDecoration(
                    color: AppColors.mainIconColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: Center(
                    child: CustomBigText(
                      text: 'إضافة إلى الأرشيف',
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
