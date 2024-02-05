import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          // this is constant must change:
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBigText(
                    text: S.of(context).browse_social,
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
              Expanded(
                child: AnimationLimiter(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        child: SlideAnimation(
                          duration: Duration(milliseconds: 2500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: FadeInAnimation(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: Duration(milliseconds: 2500),
                            child: Container(
                              child: CustomBigText(
                                text: S.of(context).social_media,
                              ),
                            ),
                          ),
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
    );
    ;
  }
}
