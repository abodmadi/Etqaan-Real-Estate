import 'package:etqaan_real_estate/data/repository/location_repo.dart';
import 'package:etqaan_real_estate/models/location_model.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  final LocationRepo locationRepo;

  LocationController({required this.locationRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  double _zoomLevel = 16;
  double get zoomLevel => _zoomLevel;

  List<LocationModel> _foundLocationsList = [];
  List<LocationModel> get foundLocationsList => _foundLocationsList;

  /*bool _isPanelOpen = false;
  bool get isPanelOpen => _isPanelOpen;

  updatePanelStatus(PanelController controller) {
    if (controller.isPanelOpen) {
      _isPanelOpen = false;
    } else {
      _isPanelOpen = true;
    }
    update();
  }*/

  Future<void> findLocations({required lanLong}) async {
    if (_isLoaded) {
      _isLoaded = false;
      //update();
    }

    Response response = await locationRepo.findLocations(latLong: lanLong);
    _foundLocationsList = [];
    if (response.statusCode == 200) {
      _isLoaded = true;
      print("responce find Locations: " + response.body.toString());
      _foundLocationsList
          .addAll(Location.fromJson(response.body).foundLocationsList!);
    } else {
      _isLoaded = true;
      print("else responce find Locations: " + response.body.toString());
    }
    update();
    //_isLoaded = false;
  }

  updateZomLevel(double newZom) {
    _zoomLevel = newZom;
    update();
  }

  initial() {
    _isLoaded = false;
    _zoomLevel = 16.0;
    _foundLocationsList = [];
    print('initialize data in Location controller');
    update();
  }
}
