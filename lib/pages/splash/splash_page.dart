import 'dart:async';
import 'package:etqaan_real_estate/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
/*   late Animation<double> animation;
  late AnimationController animationController; */
  _loadResources() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResources();
    /*  animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    ); */

    Timer(
      Duration(seconds: 7),
      () {
        Get.toNamed(RouteHelper.getHomePage());
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'http://192.168.0.183:8001/uploads/images/99.gif',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              height: Dimensions.containerSplash,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleTransition(
                        scale: animation,
                        child: Image(
                          width: Dimensions.splashImageW,
                          height: Dimensions.splashImageH,
                          image: AssetImage('assets/images/etqaanLogoRem.png'),
                        ),
                      ),
                      ScaleTransition(
                        scale: animation,
                        child: Image(
                          width: Dimensions.splashImageW,
                          height: Dimensions.splashImageH,
                          image: AssetImage(
                              'assets/images/etqaanLogoNameArRem.png'),
                        ),
                      ),
                    ],
                  ),
                  ScaleTransition(
                    scale: animation,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Image(
                        width: Dimensions.splashImageW,
                        height: Dimensions.splashImageH,
                        image: AssetImage(
                          'assets/images/etqaanLogoNameArRem.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
 */