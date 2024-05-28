import 'dart:convert';

import 'package:flutter_demo/data/model/user_model.dart';
import 'package:get_storage/get_storage.dart';


class StorageHelper {

  static const String _userId = "userId";
  static const String _userModel = "userModel";
  static const String _businessModel = "businessModel";
  static const String _userToken = "userToken";
  static const String _fcmToken = "fcmToken";
  static const String _userType = "userType";
  static const String _isLoggedIn = "isLoggedIn";
  static const String _isPayInAdvance = "isPayInAdvance";
  static const String _isHasBusiness = "isHasBusiness";
  static const String _isHasBusinessFirstStep = "isHasBusinessFirstStep";
  static const String _servicesAdded = "servicesAdded";
  static const String _businessId = "businessId";
  static const String _isIntroScreenOpenedClient = "isIntroScreenOpenedClient";
  static const String _isIntroScreenOpenedProvider = "isIntroScreenOpenedProvider";
  static const String _version = "version";
  static const String _isAvailable = "isAvailable";
  static const JsonDecoder _decoder = JsonDecoder();
  static const JsonEncoder _encoder = JsonEncoder.withIndent('  ');

  static final StorageHelper _singleton = StorageHelper._internal();

  StorageHelper._internal();

  static Future init() async {
    var result = await GetStorage.init();
    print("GetStorageIsIntilized$result");
  }

  factory StorageHelper() {
    return _singleton;
  }

  _savePref(String key, Object? value) async {
    var prefs = GetStorage();
    prefs.write(key, value);
  }

  T _getPref<T>(String key) {
    return GetStorage().read(key) as T;
  }

  void clearAll() {
    var token = getFcmToken();
    var introClient = getIsIntroScreenOpenedClient();
    var introProvider = getIsIntroScreenOpenedProvider();
    var userType = getUserType();
    var versionChecked = getVersionChecked();
    saveFcmToken(token);
    saveIsIntroScreenOpenedClient(introClient);
    saveIsIntroScreenOpenedProvider(introProvider);
    saveUserType(userType);
    saveVersionChecked(versionChecked);
  }

  int? getUserId() {
    return _getPref(_userId);
  }

  void saveUserId(int? id) {
    _savePref(_userId, id);
  }

  int getBusinessId() {
    return _getPref(_businessId);
  }

  void saveBusinessId(int? id) {
    _savePref(_businessId, id);
  }

  String? getUserToken() {
    return _getPref(_userToken);
  }

  void saveUserToken(String? token) {
    _savePref(_userToken, token);
  }

  String? getFcmToken() {
    return _getPref(_fcmToken);
  }

  void saveFcmToken(String? token) {
    _savePref(_fcmToken, token);
  }

  String? getUserType() {
    return _getPref(_userType);
  }

  void saveUserType(String? token) {
    _savePref(_userType, token);
  }

  bool getIsLoggedIn(){
    return _getPref(_isLoggedIn)??false;
  }

  void saveIsLoggedIn(bool value){
    _savePref(_isLoggedIn, value);
  }

  bool getHasBusiness(){
    return _getPref(_isHasBusiness)??false;
  }

  void saveHasBusiness(bool value){
    _savePref(_isHasBusiness, value);
  }

  bool getAvailability(){
    return _getPref(_isAvailable);
  }

  void saveAvailability(bool value){
    _savePref(_isAvailable, value);
  }

  bool getIsServicesAdded(){
    return _getPref(_servicesAdded)??false;
  }

  void saveIsServicesAdded(bool value){
    _savePref(_servicesAdded, value);
  }

  bool getIsIntroScreenOpenedClient(){
    return _getPref(_isIntroScreenOpenedClient)??false;
  }

  void saveIsIntroScreenOpenedClient(bool value){
    _savePref(_isIntroScreenOpenedClient, value);
  }

  bool getIsIntroScreenOpenedProvider(){
    return _getPref(_isIntroScreenOpenedProvider)??false;
  }

  void saveIsIntroScreenOpenedProvider(bool value){
    _savePref(_isIntroScreenOpenedProvider, value);
  }


  UserModel? getUserModel() {
    String? user = _getPref(_userModel);
    if (user != null) {
      Map<String, dynamic> userMap = _decoder.convert(user);
      return UserModel.fromJson(userMap);
    } else {
      return null;
    }
  }

  void saveUserModel(UserModel? userModel) {
    if (userModel != null) {
      String value = _encoder.convert(userModel.toJson());
      _savePref(_userModel, value);
    } else {
      _savePref(_userModel, null);
    }
  }




  bool getVersionChecked() {
    return _getPref(_version)??false;
  }

  void saveVersionChecked(bool value) {
    _savePref(_version, value);
  }

  // String convertNotificationModelToString(NotificationModel? notificationModel){
  //   String value = _encoder.convert(notificationModel);
  //   return value;
  // }
  //
  // NotificationModel? convertStringToNotificationModel(String? value){
  //   if(value==null){
  //     return null;
  //   }
  //   Map<String, dynamic> map = _decoder.convert(value);
  //   return NotificationModel.fromJson(map);
  // }


  bool getIsPayInAdvance(){
    return _getPref(_isPayInAdvance)??false;
  }

  void saveIsPayInAdvance(bool value){
    _savePref(_isPayInAdvance, value);
  }


}
