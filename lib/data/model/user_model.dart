import 'package:json_annotation/json_annotation.dart';


part 'user_model.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class UserModel {
  int? id;

  int? is_notification;
  String? firstName;
  String? lastName;
  String? fullName;
  String? accessToken;
  String? imgUrl;
  String? image;
  String? email;
  String? isoCode;
  String? countryCode;
  String? phoneNumber;
  String? roleId;
  String? password;
  String? fcmToken;
  String? deviceId;
  String? name;
  String? googleId;
  String? appleId;
  String? facebookId;
  String? role;
  String? deviceType;
  String? loginType;

  String? social_type;
  var cancellationPeriod;
  String? depositAmountType;
  var depositAmount;
  @JsonKey(defaultValue: false)
  bool? isPayFullAmount;

  @JsonKey(defaultValue: false)
  bool? isAccountConnected;

  DateTime? created_at;


  UserModel? session;
  bool? hasBusiness;
  int? businessProfileId;
  bool? isAvailable;
  double? averageRating;

  UserModel(
      {this.id,
      this.is_notification,
      this.firstName,
      this.lastName,
      this.fullName,
      this.googleId,
      this.appleId,
      this.facebookId,
      this.accessToken,
      this.imgUrl,
      this.image,
      this.email,
      this.isoCode,
      this.countryCode,
      this.phoneNumber,
      this.roleId,
      this.password,
      this.fcmToken,
      this.deviceId,
      this.name,
      this.role,
      this.deviceType,
      this.loginType,
      this.social_type,
      this.cancellationPeriod,
      this.depositAmount,
      this.isPayFullAmount,
      this.depositAmountType,
      this.isAccountConnected,
      this.created_at,
      this.session,
      this.hasBusiness,
      this.businessProfileId,
      this.isAvailable, this.averageRating,});

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
