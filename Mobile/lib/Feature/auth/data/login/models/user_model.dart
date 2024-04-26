class UserModel {
  Data? data;
  String? message;
  bool? status;

  UserModel({this.data, this.message, this.status});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
}

class Data {
  int? id;
  String? city;
  String? email;
  String? fullName;
  String? phoneNumber;
  String? token;
  String? profilePic;

  Data({
    this.city,
    this.email,
    this.fullName,
    this.phoneNumber,
    this.token,
    this.id,
    this.profilePic,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['city'] = city;
    data['email'] = email;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['token'] = token;
    data['id'] = id;
    data['profilePic'] = profilePic;

    return data;
  }

  Data.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    email = json['email'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];
    id = json['id'];
    profilePic = json['profilePic'];
  }
}
