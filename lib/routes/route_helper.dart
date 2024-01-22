import 'package:etqaan_real_estate/pages/home/home_page.dart';
import 'package:etqaan_real_estate/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  // This is showing the route name:
  static const String home = '/';
  static const String splash = '/splash';

  // This is showing the route function:
  static String getHomePage() => '$home';
  static String getSplashPage() => '$splash';

  // This is showing the page list:
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () {
        print('Navigate to splash page');
        return SplashPage();
      },
    ),
    GetPage(
      name: home,
      page: () {
        print('Navigate to home page');
        return HomePage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
