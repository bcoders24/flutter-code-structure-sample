// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      is_notification: json['is_notification'] as int?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      fullName: json['fullName'] as String?,
      googleId: json['googleId'] as String?,
      appleId: json['appleId'] as String?,
      facebookId: json['facebookId'] as String?,
      accessToken: json['accessToken'] as String?,
      imgUrl: json['imgUrl'] as String?,
      image: json['image'] as String?,
      email: json['email'] as String?,
      isoCode: json['isoCode'] as String?,
      countryCode: json['countryCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      roleId: json['roleId'] as String?,
      password: json['password'] as String?,
      fcmToken: json['fcmToken'] as String?,
      deviceId: json['deviceId'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      deviceType: json['deviceType'] as String?,
      loginType: json['loginType'] as String?,
      social_type: json['social_type'] as String?,
      cancellationPeriod: json['cancellationPeriod'],
      depositAmount: json['depositAmount'],
      isPayFullAmount: json['isPayFullAmount'] as bool? ?? false,
      depositAmountType: json['depositAmountType'] as String?,
      isAccountConnected: json['isAccountConnected'] as bool? ?? false,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      session: json['session'] == null
          ? null
          : UserModel.fromJson(json['session'] as Map<String, dynamic>),
      hasBusiness: json['hasBusiness'] as bool?,
      businessProfileId: json['businessProfileId'] as int?,
      isAvailable: json['isAvailable'] as bool?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('is_notification', instance.is_notification);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('fullName', instance.fullName);
  writeNotNull('accessToken', instance.accessToken);
  writeNotNull('imgUrl', instance.imgUrl);
  writeNotNull('image', instance.image);
  writeNotNull('email', instance.email);
  writeNotNull('isoCode', instance.isoCode);
  writeNotNull('countryCode', instance.countryCode);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('roleId', instance.roleId);
  writeNotNull('password', instance.password);
  writeNotNull('fcmToken', instance.fcmToken);
  writeNotNull('deviceId', instance.deviceId);
  writeNotNull('name', instance.name);
  writeNotNull('googleId', instance.googleId);
  writeNotNull('appleId', instance.appleId);
  writeNotNull('facebookId', instance.facebookId);
  writeNotNull('role', instance.role);
  writeNotNull('deviceType', instance.deviceType);
  writeNotNull('loginType', instance.loginType);
  writeNotNull('social_type', instance.social_type);
  writeNotNull('cancellationPeriod', instance.cancellationPeriod);
  writeNotNull('depositAmountType', instance.depositAmountType);
  writeNotNull('depositAmount', instance.depositAmount);
  writeNotNull('isPayFullAmount', instance.isPayFullAmount);
  writeNotNull('isAccountConnected', instance.isAccountConnected);
  writeNotNull('created_at', instance.created_at?.toIso8601String());
  writeNotNull('session', instance.session?.toJson());
  writeNotNull('hasBusiness', instance.hasBusiness);
  writeNotNull('businessProfileId', instance.businessProfileId);
  writeNotNull('isAvailable', instance.isAvailable);
  writeNotNull('averageRating', instance.averageRating);
  return val;
}
