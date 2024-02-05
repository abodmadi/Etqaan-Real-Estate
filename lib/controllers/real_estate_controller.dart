import 'package:etqaan_real_estate/data/repository/real_estate_repo.dart';
import 'package:etqaan_real_estate/models/project_model.dart';
import 'package:get/get.dart';

class RealEstateController extends GetxController {
  final RealEstateRepo realEstateRepo;

  RealEstateController({
    required this.realEstateRepo,
  });

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  late List<ProjectModel> _listProjects;
  List<ProjectModel> get listProjects => _listProjects;

  Future<void> getListOfRealEstates() async {
    Response response = await realEstateRepo.getRealEstates();
    if (response.statusCode == 200) {
      _isLoaded = true;
      _listProjects = [];
      _listProjects.addAll(Project.fromJson(response.body).projects!);
      print("Responce Body: " + response.body['projects'].toString());
    } else {
      print("Responce Body: " + response.body.toString());
    }
    update();
  }

  init() {
    _isLoaded = false;
    _listProjects = [];
    update();
  }
}
