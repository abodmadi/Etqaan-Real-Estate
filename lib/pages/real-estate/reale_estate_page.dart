import 'package:etqaan_real_estate/controllers/real_estate_controller.dart';
import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/pages/base/custom_list_view_shimmer.dart';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_Information_card.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class RealEstatePage extends StatelessWidget {
  const RealEstatePage({super.key});

  Future<void> _loadResources() async {
    await Get.find<RealEstateController>().getListOfRealEstates();
  }

  @override
  Widget build(BuildContext context) {
    _loadResources();
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadResources,
          backgroundColor: AppColors.mainIconColor,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBigText(
                      text: S.of(context).all_properties,
                      fontSize: Dimensions.fontSize16,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.toNamed(RouteHelper.getHomePage());
                      },
                      iconSize: Dimensions.iconSize30,
                      color: AppColors.mainIconColor,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                // this is showing the projects page body:
                GetBuilder<RealEstateController>(
                  builder: (projectController) {
                    return projectController.isLoaded
                        ? Expanded(
                            child: AnimationLimiter(
                              child: ListView.builder(
                                itemCount:
                                    projectController.listProjects.length,
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    child: SlideAnimation(
                                      duration: Duration(milliseconds: 2500),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: FadeInAnimation(
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        duration: Duration(milliseconds: 2500),
                                        child: CustomInformationCard(
                                          isFavorite: false,
                                          coverLink: projectController
                                              .listProjects[index].coverLink!,
                                          title: projectController
                                              .listProjects[index].jobName!,
                                          supTitle: projectController
                                              .listProjects[index].lineDesc!,
                                          statusCode: projectController
                                              .listProjects[index].jobState!,
                                          time: '20m ago',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : CustomListViewShimmer(
                            itemCount: 10,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
