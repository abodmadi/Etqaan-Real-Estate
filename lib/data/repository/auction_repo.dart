import 'package:etqaan_real_estate/data/API/client_api.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';

class AuctionRepo extends GetxService {
  final ClientAPI clientAPI;
  AuctionRepo({
    required this.clientAPI,
  });

  Future<Response> getAuctions() async {
    return await clientAPI.getData(url: AppConstants.PROJECT);
  }
}
