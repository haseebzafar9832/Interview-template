import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/routes/app_routes.dart';
import '../../data/models/menu_item_model.dart';
import '../../data/models/campaign_stats_model.dart';

/// Home controller for managing home screen logic
class HomeController extends GetxController {
  // Observable variables
  final RxBool isLoading = false.obs;

  // Data observables
  final Rx<CampaignStatsModel> campaignStats = CampaignStatsModel.empty().obs;

  final RxList<MenuItemModel> menuItems = <MenuItemModel>[].obs;

  // UI state
  final RxBool showWelcomeCard = true.obs;
  final RxBool showQuickActions = true.obs;
  final RxBool showRecentActivity = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeHomeData();
  }

  /// Initialize home page data
  Future<void> _initializeHomeData() async {
    setLoading(true);
    try {
      // Simulate loading data
      await Future.delayed(const Duration(milliseconds: 1000));

      // Load sample data
      _loadSampleData();

      setLoading(false);
    } catch (e) {
      setLoading(false);
      Get.snackbar(
        'Error',
        'Failed to load home data: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Load sample data for demonstration
  void _loadSampleData() {
    // Sample campaign stats
    campaignStats.value = const CampaignStatsModel(
      applications: 5,
      inProgress: 3,
      completed: 12,
      total: 20,
    );

    // Sample menu items
    menuItems.value = [
      const MenuItemModel(
        id: 'my_info',
        icon: Icons.person,
        title: AppConstants.koreanMyInformation,
      ),
      const MenuItemModel(
        id: 'notices',
        icon: Icons.announcement,
        title: AppConstants.koreanNotices,
      ),
      const MenuItemModel(
        id: 'inquiry',
        icon: Icons.help,
        title: AppConstants.koreanOneOnOneInquiry,
      ),
      const MenuItemModel(
        id: 'faq',
        icon: Icons.question_answer,
        title: AppConstants.koreanFAQ,
      ),
      const MenuItemModel(
        id: 'terms',
        icon: Icons.description,
        title: AppConstants.koreanTermsAndPolicies,
      ),
      MenuItemModel(
        id: 'logout',
        icon: Icons.logout,
        title: AppConstants.koreanLogout,
        onTap: _showLogoutDialog,
      ),
      MenuItemModel(
        id: 'withdrawal',
        icon: Icons.person_remove,
        title: AppConstants.koreanMembershipWithdrawal,
        isDestructive: true,
        onTap: _showWithdrawalDialog,
      ),
    ];
  }

  /// Set loading state
  void setLoading(bool loading) {
    isLoading.value = loading;
  }

  /// Refresh home data
  Future<void> refreshData() async {
    await _initializeHomeData();
  }

  /// Show logout confirmation dialog
  void _showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(AppRoutes.splash);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  /// Show membership withdrawal confirmation dialog
  void _showWithdrawalDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Membership Withdrawal'),
        content: const Text(
          'Are you sure you want to withdraw your membership? This action cannot be undone.',
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.offAllNamed(AppRoutes.splash);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Withdraw'),
          ),
        ],
      ),
    );
  }
}
