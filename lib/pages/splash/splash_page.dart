import 'dart:async';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  _loadResources() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResources();
    Timer(
      const Duration(seconds: 7),
      () {
        Get.toNamed(RouteHelper.getHomePage());
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              left: Dimensions.marginW10,
              right: Dimensions.marginW10,
            ),
            width: double.maxFinite,
            height: Dimensions.containerSplashH,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL + AppConstants.SPLASH_IMAGE,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
