

import 'package:json_annotation/json_annotation.dart';

part 'page_response.g.dart';
@JsonSerializable(genericArgumentFactories: true,includeIfNull: false, explicitToJson: true)
class PageResponse<TModel>{
  int? totalRecords;
  int? pageNo;
  int? pageSize;
  int? total;
  bool? isSuccess;
  String? error;
  String? message;
  List<TModel>? items;
  List<TModel>? data;
  List<TModel>? main_data;

  int? code;
  bool? apiStatus;


  PageResponse({this.totalRecords, this.pageNo, this.pageSize, this.total,this.main_data,
    this.isSuccess, this.error, this.message, this.items, this.code, this.apiStatus});

  factory PageResponse.fromJson(Map<String, dynamic> json, TModel Function(Object? json) fromJsonT,) => _$PageResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(TModel value) toJsonT) => _$PageResponseToJson(this, toJsonT);
}