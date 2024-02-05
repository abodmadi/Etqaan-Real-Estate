import 'package:etqaan_real_estate/controllers/project_controller.dart';
import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:etqaan_real_estate/widgets/custom_bottom_navbar.dart';
import 'package:etqaan_real_estate/widgets/custom_small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Height: " + Dimensions.screenHeight.toString());
    print("Width: " + Dimensions.screenWidth.toString());

    // This is a service list:
    var servicesList = [
      {
        "title": S.of(context).auctions,
        "supTitle": S.of(context).auction,
        "image": "assets/images/1.PNG",
      },
      {
        "title": S.of(context).projects,
        "supTitle": S.of(context).project,
        "image": "assets/images/2.PNG",
      },
      {
        "title": S.of(context).real_estates,
        "supTitle": S.of(context).real_estate,
        "image": "assets/images/3.PNG",
      },
      {
        "title": S.of(context).news,
        "supTitle": S.of(context).one_news,
        "image": "assets/images/4.PNG",
      },
      {
        "title": S.of(context).social_media,
        "supTitle": '',
        "image": "assets/images/66.png",
      },
    ];

    // the navigation list:
    /*List navigateTo = [
      Get.toNamed(RouteHelper.getAuctionsPage()),
      Get.toNamed(RouteHelper.getProjectsPage()),
      Get.toNamed(RouteHelper.getRealEstatesPage()),
      Get.toNamed(RouteHelper.getNewsPage()),
      Get.toNamed(RouteHelper.getSocialMediaPage()),
    ];*/
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: Dimensions.paddingH10,
            left: Dimensions.paddingW10,
            right: Dimensions.paddingW10,
            bottom: Dimensions.paddingH10,
          ),
          child: Column(
            children: [
              // this is showing the notification icon:
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: Dimensions.paddingW10,
                  right: Dimensions.paddingW10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // This is showing the text services section:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomBigText(
                          text: S.of(context).choose_the_topics,
                          fontSize: Dimensions.fontSize16 + 2,
                        ),
                        CustomSmallText(
                          text: S.of(context).you_are_interested_in,
                          fontSize: Dimensions.fontSize14,
                        ),
                      ],
                    ),
                    // This is showing the notifications icon:
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                      ),
                      color: AppColors.mainIconColor,
                      iconSize: Dimensions.iconSize30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              // This is showing the body of home page:
              Expanded(
                child: AnimationLimiter(
                  child: MasonryGridView.builder(
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        columnCount: 2,
                        child: ScaleAnimation(
                          duration: Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: GestureDetector(
                                onTap: () {
                                  if (index == 0) {
                                    Get.toNamed(RouteHelper.getAuctionsPage());
                                  } else if (index == 1) {
                                    Get.toNamed(RouteHelper.getProjectsPage());
                                  } else if (index == 2) {
                                    Get.toNamed(
                                        RouteHelper.getRealEstatesPage());
                                  } else if (index == 3) {
                                    Get.toNamed(RouteHelper.getNewsPage());
                                  } else {
                                    Get.toNamed(
                                        RouteHelper.getSocialMediaPage());
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.35),
                                        BlendMode.multiply,
                                      ),
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          servicesList[index]['image']!),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.radius20,
                                    ),
                                  ),
                                  width: double.maxFinite,
                                  // this is need to change a static value:
                                  height: index.isEven ? 240 : 300,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomBigText(
                                              textColor:
                                                  AppColors.mainBackColor2,
                                              text: servicesList[index]
                                                  ['title']!,
                                              fontSize: Dimensions.fontSize16,
                                              textAlign: TextAlign.center,
                                            ),
                                            servicesList[index]['supTitle'] !=
                                                    ''
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CustomSmallText(
                                                        textColor: AppColors
                                                            .mainBackColor2,
                                                        text: '1000',
                                                      ),
                                                      SizedBox(
                                                        width:
                                                            Dimensions.width10,
                                                      ),
                                                      CustomSmallText(
                                                        textColor: AppColors
                                                            .mainBackColor2,
                                                        text:
                                                            servicesList[index]
                                                                ['supTitle']!,
                                                      )
                                                    ],
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: servicesList.length,
                  ),
                ),
              )
            ],
          ),
        ),
        // This is showing the bottom nave bar:
        bottomNavigationBar: CustomBottomNavBar(
          onTabChange: (index) {
            print("Index:" + index.toString());
          },
        ),
      ),
    );
  }
}
