import 'package:get/get.dart';

class Dimensions {
  // This is showing the screen factors:
  static double screenWidth = Get.context!.width;
  static double screenHeight = Get.context!.height;
  // This is showing the width:
  static double width10 = screenWidth / 41.1;
  static double width20 = screenWidth / 20.55;
  static double width30 = screenWidth / 13.7;
  // This is showing the height:
  static double height10 = screenHeight / 84.3;
  static double height20 = screenHeight / 42.15;
  static double height30 = screenHeight / 28.1;
  // This is showing the padding factors:
  // height
  static double paddingH10 = screenHeight / 84.3;
  static double paddingH20 = screenHeight / 42.15;
  static double paddingH30 = screenHeight / 28.1;
  // width
  static double paddingW10 = screenWidth / 41.1;
  static double paddingW20 = screenWidth / 20.55;
  static double paddingW30 = screenWidth / 13.7;
  // This is showing the margin factors:
  // height
  static double marginH10 = screenHeight / 84.3;
  static double marginH20 = screenHeight / 42.15;
  static double marginH30 = screenHeight / 28.1;
  // width
  static double marginW10 = screenWidth / 41.1;
  static double marginW20 = screenWidth / 20.55;
  static double marginW30 = screenWidth / 13.7;
  // This is showing the icon factors:
  static double iconSize20 = screenHeight / 42.15;
  static double iconSize30 = screenHeight / 28.1;
  static double iconSize40 = screenHeight / 21.075;
  // This is showing the radius factors:
  static double radius10 = screenHeight / 84.3;
  static double radius20 = screenHeight / 42.15;
  static double radius30 = screenHeight / 28.1;
  // This is showing the text font factors:
  static double fontSize12 = screenHeight / 70.25;
  static double fontSize14 = screenHeight / 60.214;
  static double fontSize16 = screenHeight / 52.6875;
  static double fontSize24 = screenHeight / 35.125;
  // This is showing the image factors:
  static double splashImageW = screenWidth / 2.283;
  static double splashImageH = screenHeight / 4.683;
  // This is showing the widget factors:
  static double containerSplashH = screenHeight / 2.81;
}
