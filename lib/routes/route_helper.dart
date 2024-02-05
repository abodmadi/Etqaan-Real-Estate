import 'package:etqaan_real_estate/pages/auction/auction_page.dart';
import 'package:etqaan_real_estate/pages/company/company_page.dart';
import 'package:etqaan_real_estate/pages/home/home_page.dart';
import 'package:etqaan_real_estate/pages/news/news_page.dart';
import 'package:etqaan_real_estate/pages/project/project_page.dart';
import 'package:etqaan_real_estate/pages/real-estate/reale_estate_page.dart';
import 'package:etqaan_real_estate/pages/social-media/social_media_page.dart';
import 'package:etqaan_real_estate/pages/splash/splash_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  // This is showing the route name:
  static const String mainHome = '/';
  static const String splash = '/splash';
  static const String company = '/company';
  static const String projects = '/projects';
  static const String auctions = '/auctions';
  static const String news = '/news';
  static const String realEstates = '/real-estates';
  static const String socialMedia = '/social-media';

  // This is showing the route function:
  static String getHomePage() => '$mainHome';
  static String getSplashPage() => '$splash';
  static String getCompanyPage() => '$company';
  static String getProjectsPage() => '$projects';
  static String getAuctionsPage() => '$auctions';
  static String getRealEstatesPage() => '$realEstates';
  static String getNewsPage() => '$news';
  static String getSocialMediaPage() => '$socialMedia';
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
      name: mainHome,
      page: () {
        print('Navigate to home page');
        return HomePage();
      },
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: company,
      page: () {
        print('Navigate to company page');
        return CompanyPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: auctions,
      page: () {
        print('Navigate to auctions page');
        return AuctionPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: projects,
      page: () {
        print('Navigate to projects page');
        return ProjectPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: realEstates,
      page: () {
        print('Navigate to real estates page');
        return RealEstatePage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: news,
      page: () {
        print('Navigate to news page');
        return NewsPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: socialMedia,
      page: () {
        print('Navigate to social media page');
        return SocialMediaPage();
      },
      transition: Transition.fadeIn,
    ),
  ];
}
