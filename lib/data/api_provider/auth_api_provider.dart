

import 'package:dio/dio.dart';
import 'package:flutter_demo/data/api_provider/api_constant.dart';
import 'package:flutter_demo/data/injector.dart';
import 'package:flutter_demo/data/model/user_model.dart';
import 'package:flutter_demo/data/network_handling.dart';
import 'package:flutter_demo/data/shared/data_response.dart';
class AuthApiProvider {
  late Dio _dio;

  AuthApiProvider() {
    _dio = Injector().getDio();
  }

  Future<DataResponse<UserModel?>> logIn(UserModel userModel) async {
    try {
      Response response = await _dio.post(ApiConstants.logIn, data: userModel);
      var dataResponse = DataResponse<UserModel>.fromJson(response.data,
          (data) => UserModel.fromJson(data as Map<String, dynamic>));
      return dataResponse;
    } catch (e) {
      return DataResponse(
          message: NetworkHandling.getDioException(e), isSuccess: false);
    }
  }

}
