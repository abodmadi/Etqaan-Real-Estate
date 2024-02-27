import 'package:etqaan_real_estate/data/repository/favorite_repo.dart';
import 'package:etqaan_real_estate/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final FavoriteRepo favoriteRepo;

  FavoriteController({required this.favoriteRepo});

  /*Map<int, FavoriteModel> _favoriteItems = {};

  Map<int, FavoriteModel> get favoriteItems {
    _totalSavedItemsInLocalStorageList.forEach((element) {
      _favoriteItems[element.modelID!] = element;
    });
    return _favoriteItems;
  }

  List<FavoriteModel> _totalSavedItemsInLocalStorageList = [];
  List<FavoriteModel> get totalItemsToSaveInStorage => favoriteItems.entries
      .map((MapEntry<int, FavoriteModel> item) => item.value)
      .toList();*/

  Map<int, FavoriteModel> _temporaryFavoriteItemsMap = {};

  List<FavoriteModel> _temporaryFavoriteItemsList = [];
  List<FavoriteModel> get temporaryFavoriteItemsList =>
      _temporaryFavoriteItemsMap.entries
          .map((MapEntry<int, FavoriteModel> item) => item.value)
          .toList();

//-----------------------------------------------------------------------
  addItemToFavoriteItems(dynamic model) {
    bool _isExist = isFavorite(model);
    if (_isExist) {
      Get.snackbar(
        'Favorite Items',
        'هذا المحتوي تمت إضافته مسبقا',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } else {
      _temporaryFavoriteItemsMap.putIfAbsent(
        model.iD!,
        () => FavoriteModel(
          modelID: model.iD,
          model: model,
        ),
      );
    }
    favoriteRepo.addFavoriteItemsInLocalStorage(_temporaryFavoriteItemsList);
    getFavoriteItemsInLocalStorage();
    update();
  }

  addItemsToLocalStorage(totalItemsToSaveInStorage) {
    /*not use*/
  }

  getFavoriteItemsInLocalStorage() {
    print("(Controller) Local storage items: -------------------&\n" +
        favoriteRepo.getFavoriteItemsInLocalStorage().toString());
    print("(Controller) Local storage items count:" +
        favoriteRepo.getFavoriteItemsInLocalStorage().length.toString());

    //_temporaryFavoriteItemsList = favoriteRepo.getFavoriteItemsInLocalStorage();
  }

  removeFavoriteItemsInLocalStorage() {
    favoriteRepo.clearFavoriteItemsInLocalStorage();
  }

  bool isFavorite(dynamic model) {
    bool isFavorite = false;
    _temporaryFavoriteItemsList = favoriteRepo.getFavoriteItemsInLocalStorage();
    _temporaryFavoriteItemsList.forEach(
      (favoriteModel) {
        if (favoriteModel.modelID == model.ID) {
          isFavorite = true;
          update();
        }
      },
    );
    return isFavorite;
  }
}
