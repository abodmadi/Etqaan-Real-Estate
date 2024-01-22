import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_big_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Screen Width: " + Dimensions.screenWidth.toString());
    print("Screen Height: " + Dimensions.screenHeight.toString());
    return Scaffold(
      backgroundColor: AppColors.mainBackColor2,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/new-2-removebg-preview.png',
              ),
              SizedBox(
                height: 30,
              ),
              CustomBigText(
                text: ': تواصل معنا',
                fontFamily: 'GESSTwo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
