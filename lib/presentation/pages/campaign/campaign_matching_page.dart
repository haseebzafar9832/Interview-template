import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_theme.dart';
import '../../widgets/common/app_bar.dart';

/// Campaign matching screen
class CampaignMatchingPage extends StatefulWidget {
  const CampaignMatchingPage({super.key});

  @override
  State<CampaignMatchingPage> createState() => _CampaignMatchingPageState();
}

class _CampaignMatchingPageState extends State<CampaignMatchingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  final List<String> _tabTitles = [
    AppConstants.koreanApplication,
    AppConstants.koreanInProgress,
    AppConstants.koreanCompleted,
  ];

  final List<Map<String, dynamic>> _campaigns = [
    {
      'image': 'https://picsum.photos/200/200?random=1',
      'companyName': '회사명 나오는 자리',
      'description': '소개말 나오는 자리입니다 한줄만 나옵니다....',
      'tags': ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      'status': '신청',
    },
    {
      'image': 'https://picsum.photos/200/200?random=2',
      'companyName': '회사명 나오는 자리',
      'description': '소개말 나오는 자리입니다 한줄만 나옵니다....',
      'tags': ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      'status': '진행중',
    },
    {
      'image': 'https://picsum.photos/200/200?random=3',
      'companyName': '회사명 나오는 자리',
      'description': '소개말 나오는 자리입니다 한줄만 나옵니다....',
      'tags': ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      'status': '완료',
    },
    {
      'image': 'https://picsum.photos/200/200?random=4',
      'companyName': '회사명 나오는 자리',
      'description': '소개말 나오는 자리입니다 한줄만 나옵니다....',
      'tags': ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      'status': '신청',
    },
    {
      'image': 'https://picsum.photos/200/200?random=5',
      'companyName': '회사명 나오는 자리',
      'description': '소개말 나오는 자리입니다 한줄만 나옵니다....',
      'tags': ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      'status': '진행중',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabTitles.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),

                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                  ),
                  SizedBox(height: 20),
                  Text(
                    AppConstants.koreanCampaignMatching,
                    style: AppTextStyles.displayMedium,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            // Custom Tab Bar
            Container(
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border(
                  bottom: BorderSide(color: AppColors.secondaryLight, width: 1),
                ),
              ),
              child: Row(
                children:
                    _tabTitles.asMap().entries.map((entry) {
                      final index = entry.key;
                      final title = entry.value;
                      final isSelected = _currentTabIndex == index;

                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTabIndex = index;
                              _tabController.animateTo(index);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color:
                                      isSelected
                                          ? AppColors.primary
                                          : Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                            ),
                            child: Text(
                              title,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.titleMedium.copyWith(
                                color:
                                    isSelected
                                        ? Colors.black
                                        : AppColors.textSecondary,
                                fontWeight:
                                    isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),

            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children:
                    _tabTitles.asMap().entries.map((entry) {
                      final index = entry.key;
                      final title = entry.value;
                      return _buildTabContent(index, title);
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(int tabIndex, String title) {
    final filteredCampaigns =
        _campaigns.where((campaign) {
          return campaign['status'] == _tabTitles[tabIndex];
        }).toList();

    if (filteredCampaigns.isEmpty) {
      return _buildEmptyState(tabIndex);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.spacing16),
      itemCount: filteredCampaigns.length,
      itemBuilder: (context, index) {
        final campaign = filteredCampaigns[index];
        return _buildCampaignCard(campaign, index);
      },
    );
  }

  Widget _buildEmptyState(int tabIndex) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getEmptyStateIcon(tabIndex),
            size: 80,
            color: AppColors.textTertiary,
          ),
          const SizedBox(height: AppTheme.spacing16),
          Text(
            'No ${_tabTitles[tabIndex]} campaigns',
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppTheme.spacing8),
          Text(
            'Campaigns will appear here when available',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  IconData _getEmptyStateIcon(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return Icons.send;
      case 1:
        return Icons.pending;
      case 2:
        return Icons.check_circle;
      default:
        return Icons.inbox;
    }
  }

  Widget _buildCampaignCard(Map<String, dynamic> campaign, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppTheme.spacing16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radius16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campaign Image (Left side)
            ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radius12),
              child: SizedBox(
                width: 80,
                height: 80,
                child: Image.network(
                  campaign['image'] ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.background,
                      child: Icon(
                        Icons.image,
                        size: 40,
                        color: AppColors.textTertiary,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(width: AppTheme.spacing16),

            // Campaign Content (Right side)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Name (Bold title)
                  Text(
                    campaign['companyName'] ?? '회사명 없음',
                    style: AppTextStyles.titleLarge.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacing4),

                  // Description
                  Text(
                    campaign['description'] ?? '설명 없음',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppTheme.spacing12),

                  // Tags
                  SizedBox(
                    height: 32,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          (campaign['tags'] as List<dynamic>?)?.length ?? 0,
                      itemBuilder: (context, tagIndex) {
                        final tag =
                            (campaign['tags'] as List<dynamic>?)?[tagIndex];
                        final tagString = tag?.toString() ?? '';
                        return Container(
                          margin: EdgeInsets.only(
                            right:
                                tagIndex <
                                        ((campaign['tags'] as List<dynamic>?)
                                                    ?.length ??
                                                0) -
                                            1
                                    ? AppTheme.spacing8
                                    : 0,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.textInverse.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: AppColors.textInverse.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            tagString,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textInverse,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCampaignDetails(Map<String, dynamic> campaign) {
    Get.dialog(
      AlertDialog(
        title: const Text('Campaign Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Company: ${campaign['companyName'] ?? 'N/A'}'),
            const SizedBox(height: AppTheme.spacing8),
            Text('Description: ${campaign['description'] ?? 'N/A'}'),
            const SizedBox(height: AppTheme.spacing8),
            Text('Status: ${campaign['status'] ?? 'N/A'}'),
            const SizedBox(height: AppTheme.spacing8),
            Text(
              'Tags: ${((campaign['tags'] as List<dynamic>?) ?? []).join(', ')}',
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Close')),
        ],
      ),
    );
  }
}
