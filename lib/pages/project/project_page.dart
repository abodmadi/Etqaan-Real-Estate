import 'package:etqaan_real_estate/controllers/location_controller.dart';
import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/pages/maps/project_map_page.dart';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  Future<void> _loadResources() async {
    //Get.find<FavoriteController>().removeFavoriteItemsInLocalStorage();
    //Get.find<FavoriteController>().getFavoriteItemsInLocalStorage();
    //await Get.find<ProjectController>().getListOfProjects();
    await Get.find<LocationController>().findLocations(
      lanLong: [
        AppConstants.INITIAL_LATITUDE,
        AppConstants.INITIAL_LONGITUDE,
      ],
    );
    print("Load Resources");
  }

  @override
  Widget build(BuildContext context) {
    //_loadResources();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width10,
                vertical: Dimensions.width10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBigText(
                    text: S.of(context).prominent_projects,
                    fontSize: Dimensions.fontSize16,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.find<LocationController>().initial();
                      Get.toNamed(RouteHelper.getHomePage());
                    },
                    iconSize: Dimensions.iconSize30,
                    color: AppColors.mainIconColor,
                    icon: Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
            // this is showing the projects page body (old):
            /*GetBuilder<ProjectController>(
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
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.find<FavoriteController>()
                                            .addItemToFavoriteItems(
                                                projectController
                                                    .listProjects[index]);
                                      },
                                      child: GetBuilder<FavoriteController>(
                                          builder: (favoriteController) {
                                        return CustomInformationCard(
                                          isFavorite: favoriteController
                                              .isFavorite(projectController
                                                  .listProjects[index]),
                                          coverLink: projectController
                                              .listProjects[index]
                                              .coverLink!,
                                          title: projectController
                                              .listProjects[index].jobName!,
                                          supTitle: projectController
                                              .listProjects[index]
                                              .lineDesc!,
                                          statusCode: projectController
                                              .listProjects[index]
                                              .jobState!,
                                          time: '20m ago',
                                        );
                                      }),
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
            ),*/
            Expanded(
              child: ProjectsMapPage(),
            ),
          ],
        ),
      ),
    );
  }
}
