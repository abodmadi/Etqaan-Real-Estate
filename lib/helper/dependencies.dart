import 'package:etqaan_real_estate/controllers/auction_controller.dart';
import 'package:etqaan_real_estate/controllers/news_controller.dart';
import 'package:etqaan_real_estate/controllers/project_controller.dart';
import 'package:etqaan_real_estate/controllers/real_estate_controller.dart';
import 'package:etqaan_real_estate/data/API/client_api.dart';
import 'package:etqaan_real_estate/data/repository/auction_repo.dart';
import 'package:etqaan_real_estate/data/repository/news_repo.dart';
import 'package:etqaan_real_estate/data/repository/project_repo.dart';
import 'package:etqaan_real_estate/data/repository/real_estate_repo.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // this is showing the client API initialize:
  Get.lazyPut(() => ClientAPI(appBaseURL: AppConstants.BASE_URL2));
  // This is showing the Repo initialize:
  Get.lazyPut(() => ProjectRepo(clientAPI: Get.find()));
  Get.lazyPut(() => AuctionRepo(clientAPI: Get.find()));
  Get.lazyPut(() => RealEstateRepo(clientAPI: Get.find()));
  Get.lazyPut(() => NewsRepo(clientAPI: Get.find()));
  // This is showing the controller initialize:
  Get.lazyPut(() => ProjectController(projectRepo: Get.find()));
  Get.lazyPut(() => AuctionController(auctionRepo: Get.find()));
  Get.lazyPut(() => RealEstateController(realEstateRepo: Get.find()));
  Get.lazyPut(() => NewsController(newsRepo: Get.find()));
}
