import 'package:etqaan_real_estate/data/API/client_api.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';

class LocationRepo extends GetxService {
  final ClientAPI clientAPI;

  LocationRepo({required this.clientAPI});

  Future<Response> findLocations({required latLong}) async {
    print("the LatLong: "+(AppConstants.LOCATIONS + '/${latLong[0]}' + '/${latLong[1]}'));
    return await clientAPI.getData(
        url: (AppConstants.LOCATIONS + '/${latLong[0]}' + '/${latLong[1]}'));
  }
}
