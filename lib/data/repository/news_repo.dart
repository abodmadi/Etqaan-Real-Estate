import 'package:etqaan_real_estate/data/API/client_api.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';

class NewsRepo extends GetxService {
  final ClientAPI clientAPI;
  NewsRepo({
    required this.clientAPI,
  });

  Future<Response> getNews() async {
    return await clientAPI.getData(url: AppConstants.PROJECT);
  }
}
