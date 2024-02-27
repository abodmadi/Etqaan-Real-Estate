import 'dart:convert';
import 'package:etqaan_real_estate/models/favorite_model.dart';
import 'package:etqaan_real_estate/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepo extends GetxService {
  final SharedPreferences sharedPrefInstance;
  List<String> totalItemsToSaveInStorage = [];
  FavoriteRepo({required this.sharedPrefInstance});

  // This is showing the shared preferences functions:
  addFavoriteItemsInLocalStorage(List<FavoriteModel> localFavoriteItems) {
    //totalItemsToSaveInStorage = [];
    if (sharedPrefInstance.containsKey(AppConstants.LOCAL_FAVORITE_ITEMS)) {
      totalItemsToSaveInStorage =
          sharedPrefInstance.getStringList(AppConstants.LOCAL_FAVORITE_ITEMS)!;
    }
    localFavoriteItems.forEach(
      (item) {
        totalItemsToSaveInStorage.add(jsonEncode(item));
      },
    );
    sharedPrefInstance.setStringList(
        AppConstants.LOCAL_FAVORITE_ITEMS, totalItemsToSaveInStorage);
  }

  List<FavoriteModel> getFavoriteItemsInLocalStorage() {
    List<FavoriteModel> localStorageItemsList = [];
    if (sharedPrefInstance.containsKey(AppConstants.LOCAL_FAVORITE_ITEMS)) {
      sharedPrefInstance
          .getStringList(AppConstants.LOCAL_FAVORITE_ITEMS)!
          .forEach(
        (item) {
          localStorageItemsList.add(FavoriteModel.fromJson(jsonDecode(item)));
        },
      );
      return localStorageItemsList;
    } else {
      return localStorageItemsList;
    }
  }

  clearFavoriteItemsInLocalStorage() {
    print("Local storage removed -----------------------------");
    sharedPrefInstance.remove(AppConstants.LOCAL_FAVORITE_ITEMS);
  }
}
