import 'package:etqaan_real_estate/pages/favorite/favorite_page.dart';
import 'package:etqaan_real_estate/pages/home/home_body_page.dart';
import 'package:etqaan_real_estate/pages/settings/settings_page.dart';
import 'package:etqaan_real_estate/utils/dimensions.dart';
import 'package:etqaan_real_estate/widgets/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // the navigation list:
  List<Widget> pageBody = [
    HomeBodyPage(),
    FavoritePage(),
    SettingsPage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    print("Height: " + Dimensions.screenHeight.toString());
    print("Width: " + Dimensions.screenWidth.toString());

    return SafeArea(
      child: Scaffold(
        body: pageBody[currentIndex],
        // This is showing the bottom nave bar:
        bottomNavigationBar: CustomBottomNavBar(
          onTabChange: (index) {
            setState(() {
              currentIndex = index;
            });
            print("Index:" + index.toString());
          },
        ),
      ),
    );
  }
}
