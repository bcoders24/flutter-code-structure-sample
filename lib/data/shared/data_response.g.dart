// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataResponse<TModel> _$DataResponseFromJson<TModel>(
  Map<String, dynamic> json,
  TModel Function(Object? json) fromJsonTModel,
) =>
    DataResponse<TModel>(
      isSuccess: json['isSuccess'] as bool?,
      error: json['error'] as String?,
      message: json['message'] as String?,
      unread_notification: json['unread_notification'],
      data: _$nullableGenericFromJson(json['data'], fromJsonTModel),
      code: json['code'] as int?,
      apiStatus: json['apiStatus'] as bool?,
      main_data: _$nullableGenericFromJson(json['main_data'], fromJsonTModel),
      hasBusiness: json['hasBusiness'] as bool?,
      is_favourite: json['is_favourite'] as bool?,
      insufficientBalance: json['insufficientBalance'] as bool?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$DataResponseToJson<TModel>(
  DataResponse<TModel> instance,
  Object? Function(TModel value) toJsonTModel,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('is_favourite', instance.is_favourite);
  writeNotNull('unread_notification', instance.unread_notification);
  writeNotNull('error', instance.error);
  writeNotNull('message', instance.message);
  writeNotNull('data', _$nullableGenericToJson(instance.data, toJsonTModel));
  writeNotNull(
      'main_data', _$nullableGenericToJson(instance.main_data, toJsonTModel));
  writeNotNull('code', instance.code);
  writeNotNull('apiStatus', instance.apiStatus);
  writeNotNull('hasBusiness', instance.hasBusiness);
  writeNotNull('status', instance.status);
  writeNotNull('insufficientBalance', instance.insufficientBalance);
  return val;
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
