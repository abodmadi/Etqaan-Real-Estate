import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomListViewShimmer extends StatelessWidget {
  final int itemCount;
  const CustomListViewShimmer({
    super.key,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              // this is need to change a static value:
              margin: EdgeInsets.only(
                bottom: Dimensions.marginH10,
              ),
              padding: EdgeInsets.all(10),
              width: double.maxFinite,
              height: Dimensions.height10 * 15,
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.mainBackColor1,
                    width: 2.0,
                    style: BorderStyle.solid),
              ),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // This is showing the content image:
                  Expanded(
                    child: Container(
                      width: Dimensions.width10 * 20,
                      height: Dimensions.height10 * 15,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10,
                  ),
                  // This is showing the content title, description,status and publish time:
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.height10,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: CircleAvatar(
                                  backgroundColor: AppColors.smallTextColor,
                                  radius: Dimensions.radius10 / 2,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
