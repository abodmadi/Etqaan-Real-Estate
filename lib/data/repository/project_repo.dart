import 'package:etqaan_real_estate/data/API/client_api.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';

class ProjectRepo extends GetxService {
  final ClientAPI clientAPI;
  ProjectRepo({
    required this.clientAPI,
  });

  Future<Response> getProjects() async {
    return await clientAPI.getData(url: AppConstants.PROJECT);
  }
}
