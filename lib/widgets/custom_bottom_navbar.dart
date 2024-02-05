import 'package:etqaan_real_estate/generated/l10n.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Function(int) onTabChange;
  const CustomBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 30,
            offset: Offset(9, 10),
          ),
        ],
        color: AppColors.mainBackColor2,
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GNav(
          onTabChange: onTabChange,
          gap: 8,
          backgroundColor: AppColors.mainBackColor2,
          color: AppColors.bigTextColor,
          activeColor: AppColors.mainBackColor2,
          tabBackgroundColor: AppColors.mainIconColor,
          padding: EdgeInsets.all(16),
          tabs: [
            GButton(
              text: S.of(context).home,
              icon: Icons.home_rounded,
              iconSize: Dimensions.iconSize30,
              textStyle: TextStyle(
                fontFamily: 'GESSTwo',
                fontSize: Dimensions.fontSize12,
                color: AppColors.mainBackColor2,
              ),
            ),
            GButton(
              text: S.of(context).settings,
              icon: Icons.settings,
              iconSize: Dimensions.iconSize30,
              textStyle: TextStyle(
                fontFamily: 'GESSTwo',
                fontSize: Dimensions.fontSize12,
                color: AppColors.mainBackColor2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
