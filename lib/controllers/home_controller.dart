import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/user_model.dart';
import '../data/repository/user_repository.dart';

class HomeController extends GetxController {
  final UserRepository _userRepository = Get.find<UserRepository>();
  
  // Observable variables
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;
  final RxBool isRefreshing = false.obs;
  final RxString errorMessage = ''.obs;
  
  // User list for admin/moderator
  final RxList<UserModel> users = <UserModel>[].obs;
  final RxInt currentPage = 1.obs;
  final RxInt totalPages = 0.obs;
  final RxInt totalUsers = 0.obs;
  final RxBool hasMoreUsers = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadCurrentUser();
  }
  
  // Load current user profile
  Future<void> loadCurrentUser() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final user = await _userRepository.getCurrentUser();
      if (user != null) {
        currentUser.value = user;
        
        // If user is admin/moderator, load users list
        if (user.isAdmin || user.isModerator) {
          loadUsers();
        }
      }
    } catch (e) {
      errorMessage.value = 'Failed to load user profile: $e';
    } finally {
      isLoading.value = false;
    }
  }
  
  // Load users list with pagination
  Future<void> loadUsers({bool refresh = false}) async {
    try {
      if (refresh) {
        isRefreshing.value = true;
        currentPage.value = 1;
      } else {
        isLoading.value = true;
      }
      
      errorMessage.value = '';
      
      final result = await _userRepository.getUsers(
        page: currentPage.value,
        limit: 20,
        sortBy: 'created_at',
        sortOrder: 'desc',
      );
      
      if (refresh) {
        users.clear();
      }
      
      users.addAll(result['users'] as List<UserModel>);
      totalPages.value = result['totalPages'] ?? 0;
      totalUsers.value = result['total'] ?? 0;
      hasMoreUsers.value = currentPage.value < totalPages.value;
      
    } catch (e) {
      errorMessage.value = 'Failed to load users: $e';
    } finally {
      isLoading.value = false;
      isRefreshing.value = false;
    }
  }
  
  // Load more users (pagination)
  Future<void> loadMoreUsers() async {
    if (hasMoreUsers.value && !isLoading.value) {
      currentPage.value++;
      await loadUsers();
    }
  }
  
  // Refresh data
  Future<void> refreshData() async {
    await loadCurrentUser();
  }
  
  // Search users
  Future<void> searchUsers(String query) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final searchResults = await _userRepository.searchUsers(
        query: query,
        page: 1,
        limit: 50,
      );
      
      users.clear();
      users.addAll(searchResults);
      currentPage.value = 1;
      totalPages.value = 1;
      totalUsers.value = searchResults.length;
      hasMoreUsers.value = false;
      
    } catch (e) {
      errorMessage.value = 'Failed to search users: $e';
    } finally {
      isLoading.value = false;
    }
  }
  
  // Clear search and load all users
  void clearSearch() {
    currentPage.value = 1;
    loadUsers(refresh: true);
  }
  
  // Update user profile
  Future<bool> updateUserProfile(UserModel user) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final success = await _userRepository.updateUserProfile(user);
      if (success) {
        // Update current user if it's the same user
        if (currentUser.value?.id == user.id) {
          currentUser.value = user;
        }
        
        // Update in users list
        final index = users.indexWhere((u) => u.id == user.id);
        if (index != -1) {
          users[index] = user;
        }
        
        Get.snackbar(
          'Success',
          'Profile updated successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
        
        return true;
      } else {
        errorMessage.value = 'Failed to update profile';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'Error updating profile: $e';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
  
  // Delete user (admin only)
  Future<bool> deleteUser(String userId) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final success = await _userRepository.deleteAccount();
      if (success) {
        // Remove from users list
        users.removeWhere((user) => user.id == userId);
        totalUsers.value--;
        
        Get.snackbar(
          'Success',
          'User deleted successfully',
          snackPosition: SnackPosition.BOTTOM,
        );
        
        return true;
      } else {
        errorMessage.value = 'Failed to delete user';
        return false;
      }
    } catch (e) {
      errorMessage.value = 'Error deleting user: $e';
      return false;
    } finally {
      isLoading.value = false;
    }
  }
  
  // Logout
  Future<void> logout() async {
    Get.dialog(
      await Get.defaultDialog(
        title: 'Logout',
        content: const Text('Are you sure you want to logout?'),
        confirm: TextButton(
          onPressed: () {
            Get.back(); // Close dialog
            Get.offAllNamed('/login'); // Navigate to login
          },
          child: const Text('Yes'),
        ),
        cancel: TextButton(
          onPressed: () => Get.back(),
          child: const Text('No'),
        ),
      ),
    );
  }
  
  // Get user initials for avatar
  String getUserInitials(UserModel user) {
    return user.initials;
  }
  
  // Check if user has profile image
  bool hasProfileImage(UserModel user) {
    return user.hasProfileImage;
  }
  
  // Get user display name
  String getUserDisplayName(UserModel user) {
    return user.displayName;
  }
  
  // Get user role badges
  List<String> getUserRoles(UserModel user) {
    return user.roles;
  }
  
  // Check if current user is admin
  bool get isCurrentUserAdmin => currentUser.value?.isAdmin ?? false;
  
  // Check if current user is moderator
  bool get isCurrentUserModerator => currentUser.value?.isModerator ?? false;
  
  // Check if current user can manage users
  bool get canManageUsers => isCurrentUserAdmin || isCurrentUserModerator;
}
