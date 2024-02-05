import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Dimensions.height20 * 5,
        height: Dimensions.height20 * 5,
        decoration: BoxDecoration(
          color: AppColors.mainIconColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20 * 5 / 2),
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
