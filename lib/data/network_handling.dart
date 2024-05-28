
import 'dart:io';
import 'package:dio/dio.dart';

class NetworkHandling {
  static String messageData = "";

  static getDioException(error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          if (error.response?.data!=null && error.response?.data is Map<String, dynamic>){
            messageData = error.response?.data['message']??error.response?.data['error']??"";
            if(messageData.isNotEmpty){
              return messageData;
            }
          }
          messageData = error.message??"";
          switch (error.type) {
            case DioExceptionType.cancel:
              return messageData = "Request Canceled";
            case DioExceptionType.connectionTimeout:
              return messageData = 'Connection Timed Out';
            case DioExceptionType.unknown:
              return messageData = 'Unknown';
            case DioExceptionType.receiveTimeout:
              return messageData = 'Time Out';
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  return messageData = 'Bad Request';
                case 401:
                    return messageData = 'Unauthorised Exception';
                case 403:
                    return messageData = 'Unauthorised Exception';
                case 404:
                  return messageData = 'URL Not Found';
                case 408:
                  return messageData = 'Request Timed Out';
                case 500:
                  return messageData = 'Internal Server Error';
                case 503:
                  return messageData = 'Service Unavailable';
                default:
                  return messageData = 'Something wrong';
              }
            case DioExceptionType.sendTimeout:
              return messageData = 'Time out';
            case DioExceptionType.badCertificate:
              return messageData = 'Bad Certificate';
            case DioExceptionType.badResponse:
              return messageData = 'Bad Response';
            case DioExceptionType.connectionError:
              return messageData = 'Connection Error';
          }
        }
        else if (error is SocketException) {
          return messageData = 'Socket Exception';
        } else {
          return messageData = 'UnExcepted Exception';
        }
      } on FormatException catch (_) {
        return messageData = 'Format Exception';
      } catch (_) {
        return messageData = 'UnExcepted Exception';
      }
    } else {
      return  messageData = 'UnExcepted Exception';
    }
  }
}
