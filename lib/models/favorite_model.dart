class FavoriteModel {
  int? modelID;
  dynamic model;

  FavoriteModel({
    this.modelID,
    this.model,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    this.modelID = json['modelID'];
    this.model = json['model'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['modelID'] = modelID;
    data['model'] = model;
    return data;
  }
}
