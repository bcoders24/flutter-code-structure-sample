

import 'dart:io';

import 'package:flutter_demo/data/api_provider/auth_api_provider.dart';
import 'package:flutter_demo/data/model/user_model.dart';
import 'package:flutter_demo/data/shared/data_response.dart';
import 'package:flutter_demo/utils/helper/storage_helper.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{

  late AuthApiProvider _authApiProvider;
  late StorageHelper storageHelper;

  @override
  void onInit() {
    _authApiProvider = AuthApiProvider();
    storageHelper = StorageHelper();
    super.onInit();
  }
  Future signIn() async {
    if (await Utils.hasNetwork()) {
      // await checkFcmToken();
      var model = UserModel(
          email: "email",
          password: "password",
          fcmToken:StorageHelper().getFcmToken(),
          role : StorageHelper().getUserType(),
          deviceId: StorageHelper().getFcmToken(),
          deviceType: Platform.isAndroid ? "android" : "ios");
      Utils.showLoader();
      DataResponse<UserModel?> dataResponse =
      await _authApiProvider.logIn(model);
      Utils.hideLoader();
      if (dataResponse.isSuccess == false) {
        Utils.showSnackBar(dataResponse.message ?? dataResponse.error);
      } else {
          // handle redirection here
      }
    }
  }

}