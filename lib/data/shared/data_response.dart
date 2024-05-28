


import 'package:json_annotation/json_annotation.dart';

part 'data_response.g.dart';
@JsonSerializable(genericArgumentFactories: true,includeIfNull: false,explicitToJson: true)
class DataResponse<TModel>{
  bool? isSuccess;
  bool? is_favourite;
  var unread_notification;
  String? error;
  String? message;
  TModel? data;
  TModel? main_data;

  int? code;
  bool? apiStatus;

  bool? hasBusiness;
  String? status;
  bool? insufficientBalance;



  DataResponse({this.isSuccess, this.error, this.message,this.unread_notification, this.data, this.code, this.apiStatus,this.main_data,  this.hasBusiness,this.is_favourite,
    this.insufficientBalance,
  this.status});

  factory DataResponse.fromJson(Map<String, dynamic> json, TModel Function(Object? json) fromJsonT,) => _$DataResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(TModel value) toJsonT) => _$DataResponseToJson(this, toJsonT);

}