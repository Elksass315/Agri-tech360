class NextCropModel {
  Data? data;
  String? message;
  bool? status;

  NextCropModel({this.data, this.message, this.status});

  NextCropModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  double? confidence;
  String? image;
  String? previousCrop;
  String? recommendedCrop;
  String? season;
  String? soilType;

  Data(
      {this.confidence,
      this.image,
      this.previousCrop,
      this.recommendedCrop,
      this.season,
      this.soilType});

  Data.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    image = json['image'];
    previousCrop = json['previous crop'];
    recommendedCrop = json['recommended crop'];
    season = json['season'];
    soilType = json['soil type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confidence'] = confidence;
    data['image'] = image;
    data['previous crop'] = previousCrop;
    data['recommended crop'] = recommendedCrop;
    data['season'] = season;
    data['soil type'] = soilType;
    return data;
  }
}
