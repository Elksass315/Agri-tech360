import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/profile/data/datasources/profile_data_sources.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class ProfileDataSourcesImpl implements ProfileDataSources {
  @override
  Future<UserModel> getUserData() async {
    String token = LocalServices.getData(key: 'token');
    var response = await ApiServices.getData(
      endpoint: userDataendpoint,
      token: token,
    );
    UserModel user = UserModel.fromJson(response);

    return user;
  }

  @override
  Future<UserModel> updateProfile({
    required String fullName,
    required String city,
    required String phoneNumber,
  }) async {
    String token = LocalServices.getData(key: 'token');

    FormData formData = FormData.fromMap({
      'fullName': fullName,
      'city': city,
      'phoneNumber': phoneNumber,
    });

    var response = await ApiServices.put(
      url: updateuserdataendpoint,
      token: token,
      body: formData,
    );
    UserModel user = UserModel.fromJson(response.data);

    return user;
  }

  @override
  Future<void> changePassword({
    required String password,
    required String oldpassword,
  }) async {
    String token = LocalServices.getData(key: 'token');

    FormData formData = FormData.fromMap({
      'old_password': oldpassword,
      'new_password': password,
    });

    await ApiServices.put(
      url: updatepasswordendpoint,
      token: token,
      body: formData,
    );
  }
}
