import 'package:get/get.dart';
import '../models/user_model.dart';
import '../provider/api_provider.dart';

class UserRepository {
  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  
  // Get current user profile
  Future<UserModel?> getCurrentUser() async {
    try {
      final response = await _apiProvider.get('/user/profile');
      if (_apiProvider.isSuccessResponse(response)) {
        final data = _apiProvider.handleResponse(response);
        if (data['success'] && data['data'] != null) {
          return UserModel.fromJson(data['data']);
        }
      }
      return null;
    } catch (e) {
      print('Error getting current user: $e');
      return null;
    }
  }
  
  // Get user by ID
  Future<UserModel?> getUserById(String userId) async {
    try {
      final response = await _apiProvider.get('/user/$userId');
      if (_apiProvider.isSuccessResponse(response)) {
        final data = _apiProvider.handleResponse(response);
        if (data['success'] && data['data'] != null) {
          return UserModel.fromJson(data['data']);
        }
      }
      return null;
    } catch (e) {
      print('Error getting user by ID: $e');
      return null;
    }
  }
  
  // Update user profile
  Future<bool> updateUserProfile(UserModel user) async {
    try {
      final response = await _apiProvider.put(
        '/user/profile',
        body: user.toJson(),
      );
      return _apiProvider.isSuccessResponse(response);
    } catch (e) {
      print('Error updating user profile: $e');
      return false;
    }
  }
  
  // Change password
  Future<bool> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final response = await _apiProvider.post(
        '/user/change-password',
        body: {
          'current_password': currentPassword,
          'new_password': newPassword,
        },
      );
      return _apiProvider.isSuccessResponse(response);
    } catch (e) {
      print('Error changing password: $e');
      return false;
    }
  }
  
  // Upload profile image
  Future<String?> uploadProfileImage(String imagePath) async {
    try {
      final response = await _apiProvider.uploadFile(
        '/user/profile-image',
        filePath: imagePath,
        fieldName: 'profile_image',
      );
      if (_apiProvider.isSuccessResponse(response)) {
        final data = _apiProvider.handleResponse(response);
        if (data['success'] && data['data'] != null) {
          return data['data']['image_url'];
        }
      }
      return null;
    } catch (e) {
      print('Error uploading profile image: $e');
      return null;
    }
  }
  
  // Delete account
  Future<bool> deleteAccount() async {
    try {
      final response = await _apiProvider.delete('/user/account');
      return _apiProvider.isSuccessResponse(response);
    } catch (e) {
      print('Error deleting account: $e');
      return false;
    }
  }
  
  // Get user preferences
  Future<Map<String, dynamic>?> getUserPreferences() async {
    try {
      final response = await _apiProvider.get('/user/preferences');
      if (_apiProvider.isSuccessResponse(response)) {
        final data = _apiProvider.handleResponse(response);
        if (data['success'] && data['data'] != null) {
          return data['data'];
        }
      }
      return null;
    } catch (e) {
      print('Error getting user preferences: $e');
      return null;
    }
  }
  
  // Update user preferences
  Future<bool> updateUserPreferences(Map<String, dynamic> preferences) async {
    try {
      final response = await _apiProvider.put(
        '/user/preferences',
        body: preferences,
      );
      return _apiProvider.isSuccessResponse(response);
    } catch (e) {
      print('Error updating user preferences: $e');
      return false;
    }
  }
  
  // Search users
  Future<List<UserModel>> searchUsers({
    String? query,
    int page = 1,
    int limit = 20,
  }) async {
    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'limit': limit.toString(),
      };
      
      if (query != null && query.isNotEmpty) {
        queryParams['q'] = query;
      }
      
      final response = await _apiProvider.get(
        '/users/search',
        queryParameters: queryParams,
      );
      
      if (_apiProvider.isSuccessResponse(response)) {
        final data = _apiProvider.handleResponse(response);
        if (data['success'] && data['data'] != null) {
          final List<dynamic> usersList = data['data']['users'];
          return usersList.map((user) => UserModel.fromJson(user)).toList();
        }
      }
      return [];
    } catch (e) {
      print('Error searching users: $e');
      return [];
    }
  }
  
  // Get users list with pagination
  Future<Map<String, dynamic>> getUsers({
    int page = 1,
    int limit = 20,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'limit': limit.toString(),
      };
      
      if (sortBy != null) {
        queryParams['sort_by'] = sortBy;
      }
      
      if (sortOrder != null) {
        queryParams['sort_order'] = sortOrder;
      }
      
      final response = await _apiProvider.get(
        '/users',
        queryParameters: queryParams,
      );
      
      if (_apiProvider.isSuccessResponse(response)) {
        final data = _apiProvider.handleResponse(response);
        if (data['success'] && data['data'] != null) {
          final List<dynamic> usersList = data['data']['users'];
          final users = usersList.map((user) => UserModel.fromJson(user)).toList();
          
          return {
            'users': users,
            'total': data['data']['total'] ?? 0,
            'page': data['data']['page'] ?? page,
            'limit': data['data']['limit'] ?? limit,
            'totalPages': data['data']['total_pages'] ?? 0,
          };
        }
      }
      
      return {
        'users': <UserModel>[],
        'total': 0,
        'page': page,
        'limit': limit,
        'totalPages': 0,
      };
    } catch (e) {
      print('Error getting users: $e');
      return {
        'users': <UserModel>[],
        'total': 0,
        'page': page,
        'limit': limit,
        'totalPages': 0,
      };
    }
  }
}
