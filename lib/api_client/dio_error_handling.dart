import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

class DioErrorHandler {
  // Static method to handle DioException and return an error message
  static String getErrorMessage(DioException dioException) {
    if (dioException.response != null) {
      log("This is our response in handle: ${dioException.response!.data.toString()}");

      try {
        Map<String, dynamic> responseData;

        // Handle if data is in string format (sometimes Dio returns a JSON string)
        if (dioException.response!.data is String) {
          responseData = jsonDecode(dioException.response!.data);
        } else {
          responseData = dioException.response!.data;
        }

        // Priority: data.message -> message -> error -> fallback
        if (responseData.containsKey('data') &&
            responseData['data'] is Map &&
            responseData['data']['message'] != null) {
          return responseData['data']['message'];
        }

        if (responseData['message'] != null) {
          return responseData['message'];
        }

        if (responseData['error'] != null) {
          return responseData['error'];
        }

        return "Bad response from server.";
      } catch (e) {
        return "An error occurred while processing the response.";
      }
    } else {
      switch (dioException.type) {
        case DioException.connectionTimeout:
          return "Connection timeout. Please check your internet connection.";
        case DioException.sendTimeout:
          return "Send timeout. Please try again.";
        case DioException.receiveTimeout:
          return "Receive timeout. Please try again.";
        case DioException.requestCancelled:
          return "Request cancelled.";
        case DioException.connectionError:
          return "Connection error. Please check your internet connection.";
        default:
          return "An unexpected error occurred. Please try again.";
      }
    }
  }
}
