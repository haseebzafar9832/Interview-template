import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/common/app_bar.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/routes/app_routes.dart';
import '../../../data/models/menu_item_model.dart';
import '../../../data/models/campaign_stats_model.dart';

/// Home page
class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final isDesktop = screenSize.width > 900;

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
            padding: EdgeInsets.all(
              isDesktop
                  ? 24.0
                  : isTablet
                  ? 20.0
                  : AppTheme.spacing16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header with Korean Greeting
                _buildProfileHeader(isTablet, isDesktop),
                SizedBox(height: isDesktop ? 32.0 : AppTheme.spacing24),

                // Campaign Statistics
                _buildCampaignStats(isTablet, isDesktop),
                SizedBox(height: isDesktop ? 32.0 : AppTheme.spacing24),

                // Menu Items
                _buildMenuItems(isTablet, isDesktop),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildProfileHeader(bool isTablet, bool isDesktop) {
    final avatarSize =
        isDesktop
            ? 100.0
            : isTablet
            ? 90.0
            : 80.0;
    final titleSize =
        isDesktop
            ? 24.0
            : isTablet
            ? 22.0
            : 20.0;
    final subtitleSize =
        isDesktop
            ? 16.0
            : isTablet
            ? 15.0
            : 14.0;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppConstants.koreanGreeting,
                style: AppTextStyles.headlineMedium.copyWith(
                  fontSize: titleSize,
                ),
              ),
              Text(
                AppConstants.koreanGreeting1,
                style: AppTextStyles.labelLarge.copyWith(
                  fontSize: subtitleSize,
                ),
              ),
            ],
          ),
        ),

        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(avatarSize / 2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt,
                color: AppColors.secondaryDark,
                size:
                    isDesktop
                        ? 32.0
                        : isTablet
                        ? 28.0
                        : 24.0,
              ),
              SizedBox(height: isDesktop ? 6.0 : 4.0),
              Text(
                AppConstants.koreanImageRegistration,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.secondaryDark,
                  fontSize: isDesktop ? 12.0 : 10.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCampaignStats(bool isTablet, bool isDesktop) {
    final cardHeight =
        isDesktop
            ? 140.0
            : isTablet
            ? 130.0
            : 121.0;
    final horizontalPadding =
        isDesktop
            ? 28.0
            : isTablet
            ? 24.0
            : 20.0;
    final titleSize =
        isDesktop
            ? 18.0
            : isTablet
            ? 16.0
            : 14.0;
    final valueSize =
        isDesktop
            ? 28.0
            : isTablet
            ? 24.0
            : 20.0;
    final labelSize =
        isDesktop
            ? 14.0
            : isTablet
            ? 13.0
            : 12.0;

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.campaignMatching);
      },
      child: SizedBox(
        height: cardHeight,
        child: Card(
          elevation: 2,
          color: AppColors.cardColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0xffF2F2F2)),
            borderRadius: BorderRadius.circular(AppTheme.radius16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppConstants.myAccount,
                      style: AppTextStyles.titleSmall.copyWith(
                        fontSize: titleSize,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size:
                          isDesktop
                              ? 22.0
                              : isTablet
                              ? 20.0
                              : 18.0,
                    ),
                  ],
                ),
                SizedBox(height: isDesktop ? 8.0 : AppTheme.spacing4),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => _buildStatItem(
                        value:
                            controller.campaignStats.value.applications
                                .toString(),
                        label: AppConstants.koreanApplication,
                        valueSize: valueSize,
                        labelSize: labelSize,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size:
                          isDesktop
                              ? 22.0
                              : isTablet
                              ? 20.0
                              : 18.0,
                      color: AppColors.secondaryLight,
                    ),

                    Obx(
                      () => _buildStatItem(
                        value:
                            controller.campaignStats.value.inProgress
                                .toString(),
                        label: AppConstants.koreanInProgress,
                        valueSize: valueSize,
                        labelSize: labelSize,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size:
                          isDesktop
                              ? 22.0
                              : isTablet
                              ? 20.0
                              : 18.0,
                      color: AppColors.secondaryLight,
                    ),

                    Obx(
                      () => _buildStatItem(
                        value:
                            controller.campaignStats.value.completed.toString(),
                        label: AppConstants.koreanCompleted,
                        valueSize: valueSize,
                        labelSize: labelSize,
                      ),
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

  Widget _buildStatItem({
    required String value,
    required String label,
    required double valueSize,
    required double labelSize,
  }) {
    return Column(
      children: [
        const SizedBox(height: AppTheme.spacing4),

        Text(
          value,
          style: AppTextStyles.headlineMedium2.copyWith(
            color: AppColors.primary,
            fontSize: valueSize,
          ),
        ),
        const SizedBox(height: AppTheme.spacing4),
        Text(
          label,
          style: AppTextStyles.titleMedium.copyWith(fontSize: labelSize),
        ),
      ],
    );
  }

  Widget _buildMenuItems(bool isTablet, bool isDesktop) {
    final itemHeight =
        isDesktop
            ? 70.0
            : isTablet
            ? 65.0
            : 60.0;
    final iconSize =
        isDesktop
            ? 24.0
            : isTablet
            ? 22.0
            : 19.0;
    final titleSize =
        isDesktop
            ? 16.0
            : isTablet
            ? 15.0
            : 14.0;
    final arrowSize =
        isDesktop
            ? 20.0
            : isTablet
            ? 18.0
            : 16.0;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children:
                controller.menuItems.map((item) {
                  return Container(
                    height: itemHeight,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.secondary),
                      ),
                    ),
                    child: InkWell(
                      onTap: item.onTap,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 16.0 : 10.0,
                          vertical: isDesktop ? 22.0 : 18.0,
                        ),
                        child: Row(
                          children: [
                            Icon(item.icon, size: iconSize),
                            SizedBox(width: isDesktop ? 16.0 : 10.0),

                            Expanded(
                              child: Text(
                                item.title,
                                style: AppTextStyles.buttonMedium.copyWith(
                                  fontSize: titleSize,
                                ),
                              ),
                            ),

                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.textTertiary,
                              size: arrowSize,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
