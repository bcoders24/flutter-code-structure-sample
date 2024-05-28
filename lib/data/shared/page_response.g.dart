// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageResponse<TModel> _$PageResponseFromJson<TModel>(
  Map<String, dynamic> json,
  TModel Function(Object? json) fromJsonTModel,
) =>
    PageResponse<TModel>(
      totalRecords: json['totalRecords'] as int?,
      pageNo: json['pageNo'] as int?,
      pageSize: json['pageSize'] as int?,
      total: json['total'] as int?,
      main_data:
          (json['main_data'] as List<dynamic>?)?.map(fromJsonTModel).toList(),
      isSuccess: json['isSuccess'] as bool?,
      error: json['error'] as String?,
      message: json['message'] as String?,
      items: (json['items'] as List<dynamic>?)?.map(fromJsonTModel).toList(),
      code: json['code'] as int?,
      apiStatus: json['apiStatus'] as bool?,
    )..data = (json['data'] as List<dynamic>?)?.map(fromJsonTModel).toList();

Map<String, dynamic> _$PageResponseToJson<TModel>(
  PageResponse<TModel> instance,
  Object? Function(TModel value) toJsonTModel,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalRecords', instance.totalRecords);
  writeNotNull('pageNo', instance.pageNo);
  writeNotNull('pageSize', instance.pageSize);
  writeNotNull('total', instance.total);
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('error', instance.error);
  writeNotNull('message', instance.message);
  writeNotNull('items', instance.items?.map(toJsonTModel).toList());
  writeNotNull('data', instance.data?.map(toJsonTModel).toList());
  writeNotNull('main_data', instance.main_data?.map(toJsonTModel).toList());
  writeNotNull('code', instance.code);
  writeNotNull('apiStatus', instance.apiStatus);
  return val;
}
