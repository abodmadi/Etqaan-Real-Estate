import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:etqaan_real_estate/widgets/custom_small_text.dart';
import 'package:flutter/material.dart';

class CustomInformationCard extends StatelessWidget {
  final String coverLink;
  final String title;
  final String supTitle;
  final String time;
  final int statusCode;
  const CustomInformationCard({
    super.key,
    required this.coverLink,
    required this.title,
    required this.supTitle,
    required this.statusCode,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                borderRadius: BorderRadius.circular(Dimensions.radius10),
                color: AppColors.mainIconColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL2 + coverLink,
                  ),
                ),
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
                CustomBigText(
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  text: title,
                ),
                CustomSmallText(
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: supTitle,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    statusCode == 30
                        ? CustomSmallText(
                            text: S.of(context).running,
                            textColor: AppColors.mainIconColor,
                          )
                        : CustomSmallText(
                            text: S.of(context).archived,
                          ),
                    CircleAvatar(
                      backgroundColor: AppColors.smallTextColor,
                      radius: Dimensions.radius10 / 2,
                    ),
                    CustomSmallText(text: time),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
