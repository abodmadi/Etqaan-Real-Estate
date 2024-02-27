import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_Information_card.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomSlidingPanel extends StatelessWidget {
  final ScrollController scrollController;
  final PanelController panelController;
  final List foundLocationItems;
  final bool isLoaded;
  const CustomSlidingPanel({
    super.key,
    required this.scrollController,
    required this.panelController,
    required this.isLoaded,
    required this.foundLocationItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          //flex: 1,
          child: Container(
            width: double.maxFinite,
            //color: Colors.amber,
            child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      panelController.isAttached
                          ? panelController.isPanelOpen
                              ? panelController.close()
                              : panelController.open()
                          : print('pressss!');
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.marginH20 + 2,
                        left: Dimensions.marginW10,
                        bottom: Dimensions.marginH10 + 2,
                        right: Dimensions.marginW10,
                      ),
                      width: Dimensions.width30 * 2,
                      height: Dimensions.height10 - 2,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(135, 10, 125, 148),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10 + 2),
                      ),
                    ),
                  ),
                  isLoaded
                      ? CustomBigText(
                          text: foundLocationItems.length.toString() + " نتائج",
                        )
                      : Shimmer.fromColors(
                          baseColor: AppColors.bigTextColor,
                          highlightColor: Colors.grey[300]!,
                          child: CustomBigText(text: "جاري البحث عن نتائج"),
                        ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
              controller: scrollController,
              itemCount: foundLocationItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getProjectDetailsPage(index));
                  },
                  child: CustomInformationCard(
                    id: index,
                    coverLink: foundLocationItems[index].marker,
                    title: foundLocationItems[index].name,
                    supTitle: "sfsdfsdfsdfsdf",
                    statusCode: 1,
                    time: '3:00',
                    isFavorite: true,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
