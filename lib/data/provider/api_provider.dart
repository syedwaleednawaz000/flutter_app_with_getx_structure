import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../../config/app_constants.dart';

class ApiProvider {
  static final ApiProvider _instance = ApiProvider._internal();
  factory ApiProvider() => _instance;
  ApiProvider._internal();

  late http.Client _client;
  String? _authToken;
  String _baseUrl = AppConstants.baseUrl;

  void initialize() {
    _client = http.Client();
  }

  void setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  void setAuthToken(String token) {
    _authToken = token;
  }

  void clearAuthToken() {
    _authToken = null;
  }

  Map<String, String> get _headers {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (_authToken != null) {
      headers['Authorization'] = 'Bearer $_authToken';
    }

    return headers;
  }

  Uri _buildUri(String endpoint) {
    return Uri.parse('$_baseUrl${AppConstants.apiVersion}$endpoint');
  }

  // GET request
  Future<http.Response> get(
    String endpoint, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      if (queryParameters != null) {
        uri.replace(queryParameters: queryParameters);
      }

      final response = await _client
          .get(uri, headers: {..._headers, ...?headers})
          .timeout(Duration(milliseconds: AppConstants.connectionTimeout));

      _logRequest('GET', uri.toString(), null, response);
      return response;
    } catch (e) {
      _logError('GET', endpoint, e);
      rethrow;
    }
  }

  // POST request
  Future<http.Response> post(
    String endpoint, {
    dynamic body,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      if (queryParameters != null) {
        uri.replace(queryParameters: queryParameters);
      }

      final response = await _client
          .post(
            uri,
            headers: {..._headers, ...?headers},
            body: body is Map ? jsonEncode(body) : body,
          )
          .timeout(Duration(milliseconds: AppConstants.connectionTimeout));

      _logRequest('POST', uri.toString(), body, response);
      return response;
    } catch (e) {
      _logError('POST', endpoint, e);
      rethrow;
    }
  }

  // PUT request
  Future<http.Response> put(
    String endpoint, {
    dynamic body,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      if (queryParameters != null) {
        uri.replace(queryParameters: queryParameters);
      }

      final response = await _client
          .put(
            uri,
            headers: {..._headers, ...?headers},
            body: body is Map ? jsonEncode(body) : body,
          )
          .timeout(Duration(milliseconds: AppConstants.connectionTimeout));

      _logRequest('PUT', uri.toString(), body, response);
      return response;
    } catch (e) {
      _logError('PUT', endpoint, e);
      rethrow;
    }
  }

  // PATCH request
  Future<http.Response> patch(
    String endpoint, {
    dynamic body,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      if (queryParameters != null) {
        uri.replace(queryParameters: queryParameters);
      }

      final response = await _client
          .patch(
            uri,
            headers: {..._headers, ...?headers},
            body: body is Map ? jsonEncode(body) : body,
          )
          .timeout(Duration(milliseconds: AppConstants.connectionTimeout));

      _logRequest('PATCH', uri.toString(), body, response);
      return response;
    } catch (e) {
      _logError('PATCH', endpoint, e);
      rethrow;
    }
  }

  // DELETE request
  Future<http.Response> delete(
    String endpoint, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      if (queryParameters != null) {
        uri.replace(queryParameters: queryParameters);
      }

      final response = await _client
          .delete(uri, headers: {..._headers, ...?headers})
          .timeout(Duration(milliseconds: AppConstants.connectionTimeout));

      _logRequest('DELETE', uri.toString(), null, response);
      return response;
    } catch (e) {
      _logError('DELETE', endpoint, e);
      rethrow;
    }
  }

  // Upload file
  Future<http.Response> uploadFile(
    String endpoint, {
    required String filePath,
    required String fieldName,
    Map<String, String>? fields,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      final request = http.MultipartRequest('POST', uri);

      // Add headers
      request.headers.addAll({..._headers, ...?headers});

      // Add file
      final file = await http.MultipartFile.fromPath(fieldName, filePath);
      request.files.add(file);

      // Add fields
      if (fields != null) {
        request.fields.addAll(fields);
      }

      final streamedResponse = await request.send().timeout(
        Duration(milliseconds: AppConstants.connectionTimeout),
      );

      final response = await http.Response.fromStream(streamedResponse);
      _logRequest('UPLOAD', uri.toString(), 'File: $filePath', response);
      return response;
    } catch (e) {
      _logError('UPLOAD', endpoint, e);
      rethrow;
    }
  }

  // Download file
  Future<http.Response> downloadFile(
    String endpoint, {
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final uri = _buildUri(endpoint);
      if (queryParameters != null) {
        uri.replace(queryParameters: queryParameters);
      }

      final response = await _client
          .get(uri, headers: {..._headers, ...?headers})
          .timeout(Duration(milliseconds: AppConstants.connectionTimeout));

      _logRequest('DOWNLOAD', uri.toString(), null, response);
      return response;
    } catch (e) {
      _logError('DOWNLOAD', endpoint, e);
      rethrow;
    }
  }

  // Handle response
  Map<String, dynamic> handleResponse(http.Response response) {
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isEmpty) {
          return {'success': true, 'data': null};
        }
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return _handleErrorResponse(response);
      }
    } catch (e) {
      return {
        'success': false,
        'error': 'Failed to parse response',
        'details': e.toString(),
      };
    }
  }

  // Handle error response
  Map<String, dynamic> _handleErrorResponse(http.Response response) {
    try {
      final errorBody = jsonDecode(response.body) as Map<String, dynamic>;
      return {
        'success': false,
        'error': errorBody['message'] ?? 'Request failed',
        'statusCode': response.statusCode,
        'details': errorBody,
      };
    } catch (e) {
      return {
        'success': false,
        'error': 'Request failed with status ${response.statusCode}',
        'statusCode': response.statusCode,
        'details': response.body,
      };
    }
  }

  // Check if response is successful
  bool isSuccessResponse(http.Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  // Check if response has error
  bool hasErrorResponse(http.Response response) {
    return response.statusCode >= 400;
  }

  // Get error message from response
  String getErrorMessage(http.Response response) {
    try {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      return body['message'] ?? 'Request failed with status ${response.statusCode}';
    } catch (e) {
      return 'Request failed with status ${response.statusCode}';
    }
  }

  // Logging methods
  void _logRequest(String method, String url, dynamic body, http.Response response) {
    if (Get.isLogEnable) {
      print('🌐 API Request: $method $url');
      if (body != null) {
        print('📤 Request Body: $body');
      }
      print('📥 Response Status: ${response.statusCode}');
      print('📥 Response Body: ${response.body}');
    }
  }

  void _logError(String method, String endpoint, dynamic error) {
    if (Get.isLogEnable) {
      print('❌ API Error: $method $endpoint');
      print('❌ Error Details: $error');
    }
  }

  // Dispose
  void dispose() {
    _client.close();
  }
}
