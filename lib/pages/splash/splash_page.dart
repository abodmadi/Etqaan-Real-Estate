import 'dart:async';

import 'package:etqaan_real_estate/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  _loadResources() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResources();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    );
    Timer(
      Duration(seconds: 4),
      () {
        print('Welcome');
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.maxFinite,
              height: 215,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleTransition(
                        scale: animation,
                        child: Image(
                          width: 180,
                          height: 180,
                          image: AssetImage('assets/images/etqaanLogoRem.png'),
                        ),
                      ),
                      ScaleTransition(
                        scale: animation,
                        child: Image(
                          width: 180,
                          height: 180,
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
                      child: Text(
                        'Etqaan Real Estate',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColors.bigTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
