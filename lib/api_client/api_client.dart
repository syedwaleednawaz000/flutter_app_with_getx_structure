import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:structure/config/app_constants.dart';
import 'package:structure/routes/app_routes.dart';
import 'package:structure/utils/app_urls.dart';
import 'package:structure/utils/toast_message.dart';

class APIClient {
  Dio _dio = Dio();

  APIClient() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      baseUrl: AppUrls.serverBaseURL,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  Future<Map<String, String>> _getHeaders() async {
    final box = GetStorage();
    final token = box.read(AppConstants.saveUserToken);

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token != null ? 'Bearer $token' : '',
    };
  }



  /// GET Request
  Future<Response> get({required String url}) async {
    final headers = await _getHeaders();
    try {
      return await _dio.get(
        url,
        options: Options(headers: headers, responseType: ResponseType.json),
      );
    } on DioException catch (error) {
      if (error.response?.statusCode == 401) {
        await cleanLocalData();
      }
      rethrow;
    }
  }

  /// POST Request
  Future<Response> post({required String url, dynamic params}) async {
    final headers = await _getHeaders();
    try {
      return await _dio.post(
        url,
        data: params,
        options: Options(headers: headers, responseType: ResponseType.json),
      );
    } on DioException catch (error) {
      if (error.response != null) {
        final map = jsonDecode(error.response.toString());
        final message = map['data']?['message'] ?? map['message'];

        if (message != null) {
          FlutterToast.toastMessage(message: message, isError: true,);
          if (message == "Please verify your email before logging in.") {
            Get.toNamed(AppRoutes.login, arguments: "login");
          }
        }

        if (error.response?.statusCode == 401) {
          await cleanLocalData();
        }
      }
      rethrow;
    }
  }

  /// DELETE Request
  Future<Response> delete({required String url, dynamic params}) async {
    final headers = await _getHeaders();
    try {
      return await _dio.delete(
        url,
        data: params,
        options: Options(headers: headers, responseType: ResponseType.json),
      );
    } on DioException catch (error) {
      if (error.response != null) {
        final map = jsonDecode(error.response.toString());
        final message = map['message'] ?? map['error'];

        if (message != null) {
          FlutterToast.toastMessage(message: message, isError: true);
        }

        if (error.response?.statusCode == 401) {
          await cleanLocalData();
        }
      }
      rethrow;
    }
  }

  /// PATCH Request
  Future<Response> patch({required String url, dynamic params,}) async {
    final headers = await _getHeaders();

    // Remove Content-Type header for FormData to let Dio set it automatically
    if (params is FormData) {
      headers.remove('Content-Type');
    }

    try {
        return await _dio.patch(
          url,
          data: params,
          options: Options(headers: headers, responseType: ResponseType.json),
        );

    } on DioException catch (error) {
      if (error.response != null) {
        try {
          final map = jsonDecode(error.response.toString());
          print("Dio PATCH Error: ${map['message']}");
        } catch (e) {
          print("Dio PATCH Error: ${error.response?.data}");
        }
      }
      rethrow;
    }
  }

  /// PUT Request
  Future<Response> put({required String url, dynamic params}) async {
    final headers = await _getHeaders();
    try {
      return await _dio.put(
        url,
        data: params,
        options: Options(headers: headers, responseType: ResponseType.json),
      );
    } on DioException catch (error) {
      if (error.response != null) {
        print("PUT Error Status: ${error.response?.statusCode}");
        print("PUT Error: ${error.response?.data}");
      }
      rethrow;
    }
  }

  /// DOWNLOAD Request
  Future<Response> download(String url, String pathName,
      void Function(int, int)? onReceiveProgress) async {
    final headers = await _getHeaders();
    try {
      return await _dio.download(
        url,
        pathName,
        onReceiveProgress: onReceiveProgress,
        options: Options(headers: headers),
      );
    } on DioException catch (error) {
      print("Download error: ${error.response}");
      rethrow;
    }
  }

  /// Clear all local data and logout
  Future<void> cleanLocalData() async {
    final box = GetStorage();
    box.remove(AppConstants.saveUserToken);
    box.remove('role');
    FlutterToast.toastMessage(message: "Unauthenticated", isError: true);
    Get.offAllNamed(AppRoutes.login);
  }
}
