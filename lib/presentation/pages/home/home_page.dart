import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes/app_routes.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/common/app_bar.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_theme.dart';

/// Home page
class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'MY FLYN', showBackButton: false),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: controller.refreshData,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.spacing16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header with Korean Greeting
                _buildProfileHeader(),
                const SizedBox(height: AppTheme.spacing24),

                // Campaign Statistics
                _buildCampaignStats(),
                const SizedBox(height: AppTheme.spacing24),

                // Menu Items
                _buildMenuItems(),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildProfileHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.koreanGreeting,
                style: AppTextStyles.headlineMedium,
              ),
              Text(
                AppConstants.koreanGreeting1,
                style: AppTextStyles.labelLarge,
              ),
            ],
          ),
        ),

        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt, color: AppColors.secondaryDark, size: 24),
              const SizedBox(height: 4),
              Text(
                AppConstants.koreanImageRegistration,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.secondaryDark,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCampaignStats() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.campaignMatching);
      },
      child: SizedBox(
        height: 121,
        child: Card(
          elevation: 2,
          color: AppColors.cardColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xffF2F2F2)),
            borderRadius: BorderRadius.circular(AppTheme.radius16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppConstants.myAccount,
                      style: AppTextStyles.titleSmall,
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 18),
                  ],
                ),
                const SizedBox(height: AppTheme.spacing4),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem(
                      value: '0',
                      label: AppConstants.koreanApplication,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: AppColors.secondaryLight,
                    ),

                    // const SizedBox(width: AppTheme.spacing16),
                    _buildStatItem(
                      value: '0',
                      label: AppConstants.koreanInProgress,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: AppColors.secondaryLight,
                    ),

                    // const SizedBox(width: AppTheme.spacing16),
                    _buildStatItem(
                      value: '0',
                      label: AppConstants.koreanCompleted,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem({required String value, required String label}) {
    return Column(
      children: [
        const SizedBox(height: AppTheme.spacing4),

        Text(
          value,
          style: AppTextStyles.headlineMedium2.copyWith(
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: AppTheme.spacing4),
        Text(label, style: AppTextStyles.titleMedium),
      ],
    );
  }

  Widget _buildMenuItems() {
    final List<Map<String, dynamic>> _menuItems = [
      {'icon': Icons.person, 'title': AppConstants.koreanMyInformation},
      {'icon': Icons.announcement, 'title': AppConstants.koreanNotices},
      {'icon': Icons.help, 'title': AppConstants.koreanOneOnOneInquiry},
      {'icon': Icons.question_answer, 'title': AppConstants.koreanFAQ},
      {'icon': Icons.description, 'title': AppConstants.koreanTermsAndPolicies},
      {'icon': Icons.logout, 'title': AppConstants.koreanLogout},
      {
        'icon': Icons.person_remove,
        'title': AppConstants.koreanMembershipWithdrawal,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children:
              _menuItems.asMap().entries.map((entry) {
                final item = entry.value;
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.secondary),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 18,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          item['icon'],
                          color: AppColors.textSecondary,
                          size: 19,
                        ),
                        SizedBox(width: 10),

                        Text(item['title'], style: AppTextStyles.buttonMedium),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.textTertiary,
                          size: 16,
                        ),

                        // Divider(height: 4, color: Colors.red),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

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
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: const Text('Withdraw'),
          ),
        ],
      ),
    );
  }
}
