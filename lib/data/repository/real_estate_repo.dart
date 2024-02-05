import 'package:etqaan_real_estate/data/API/client_api.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';

class RealEstateRepo extends GetxService {
  final ClientAPI clientAPI;
  RealEstateRepo({
    required this.clientAPI,
  });

  Future<Response> getRealEstates() async {
    return await clientAPI.getData(url: AppConstants.PROJECT);
  }
}
