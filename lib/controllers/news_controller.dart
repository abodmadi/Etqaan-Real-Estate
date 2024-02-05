import 'package:etqaan_real_estate/data/repository/news_repo.dart';
import 'package:etqaan_real_estate/models/project_model.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  final NewsRepo newsRepo;

  NewsController({
    required this.newsRepo,
  });

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  late List<ProjectModel> _listProjects;
  List<ProjectModel> get listProjects => _listProjects;

  Future<void> getListOfNews() async {
    Response response = await newsRepo.getNews();
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
