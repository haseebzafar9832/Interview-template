import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/campaign_model.dart';

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

  final List<CampaignModel> _campaigns = [
    const CampaignModel(
      id: '1',
      image: 'https://picsum.photos/200/200?random=1',
      companyName: '회사명 나오는 자리',
      description: '소개말 나오는 자리입니다 한줄만 나옵니다....',
      tags: ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      status: '신청',
    ),
    const CampaignModel(
      id: '2',
      image: 'https://picsum.photos/200/200?random=2',
      companyName: '회사명 나오는 자리',
      description: '소개말 나오는 자리입니다 한줄만 나옵니다....',
      tags: ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      status: '진행중',
    ),
    const CampaignModel(
      id: '3',
      image: 'https://picsum.photos/200/200?random=3',
      companyName: '회사명 나오는 자리',
      description: '소개말 나오는 자리입니다 한줄만 나옵니다....',
      tags: ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      status: '완료',
    ),
    const CampaignModel(
      id: '4',
      image: 'https://picsum.photos/200/200?random=4',
      companyName: '회사명 나오는 자리',
      description: '소개말 나오는 자리입니다 한줄만 나옵니다....',
      tags: ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      status: '신청',
    ),
    const CampaignModel(
      id: '5',
      image: 'https://picsum.photos/200/200?random=5',
      companyName: '회사명 나오는 자리',
      description: '소개말 나오는 자리입니다 한줄만 나옵니다....',
      tags: ['F&B', '패션', '육아/키즈', '리빙/인테리어'],
      status: '진행중',
    ),
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
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    final isDesktop = screenSize.width > 900;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            _buildHeader(context, isTablet, isDesktop),

            // Custom Tab Bar
            _buildTabBar(isTablet, isDesktop),

            // Tab Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children:
                    _tabTitles.asMap().entries.map((entry) {
                      final index = entry.key;
                      final title = entry.value;
                      return _buildTabContent(
                        index,
                        title,
                        isTablet,
                        isDesktop,
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isTablet, bool isDesktop) {
    final horizontalPadding =
        isDesktop
            ? 32.0
            : isTablet
            ? 24.0
            : 15.0;
    final titleSize =
        isDesktop
            ? 32.0
            : isTablet
            ? 28.0
            : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: isDesktop ? 20.0 : 15.0),

          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: isDesktop ? 24.0 : 18.0,
            ),
          ),

          SizedBox(height: isDesktop ? 24.0 : 20.0),

          Text(
            AppConstants.koreanCampaignMatching,
            style: AppTextStyles.displayMedium.copyWith(fontSize: titleSize),
          ),

          SizedBox(height: isDesktop ? 24.0 : 20.0),
        ],
      ),
    );
  }

  Widget _buildTabBar(bool isTablet, bool isDesktop) {
    final tabHeight =
        isDesktop
            ? 64.0
            : isTablet
            ? 56.0
            : 48.0;
    final fontSize =
        isDesktop
            ? 18.0
            : isTablet
            ? 16.0
            : 14.0;

    return Container(
      height: tabHeight,
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
                    padding: EdgeInsets.symmetric(
                      vertical: isDesktop ? 20.0 : 16.0,
                    ),
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
                        fontSize: fontSize,
                        color:
                            isSelected ? Colors.black : AppColors.textSecondary,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildTabContent(
    int tabIndex,
    String title,
    bool isTablet,
    bool isDesktop,
  ) {
    final filteredCampaigns =
        _campaigns.where((campaign) {
          return campaign.status == _tabTitles[tabIndex];
        }).toList();

    if (filteredCampaigns.isEmpty) {
      return _buildEmptyState(tabIndex, isTablet, isDesktop);
    }

    // Use GridView for tablet and desktop, ListView for mobile
    if (isTablet || isDesktop) {
      final crossAxisCount = isDesktop ? 2 : 1;
      final childAspectRatio = isDesktop ? 2.5 : 3.0;

      return GridView.builder(
        padding: EdgeInsets.all(isDesktop ? 24.0 : 20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: isDesktop ? 24.0 : 20.0,
          mainAxisSpacing: isDesktop ? 24.0 : 20.0,
        ),
        itemCount: filteredCampaigns.length,
        itemBuilder: (context, index) {
          final campaign = filteredCampaigns[index];
          return _buildCampaignCard(campaign, index, isTablet, isDesktop);
        },
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        itemCount: filteredCampaigns.length,
        itemBuilder: (context, index) {
          final campaign = filteredCampaigns[index];
          return _buildCampaignCard(campaign, index, isTablet, isDesktop);
        },
      );
    }
  }

  Widget _buildEmptyState(int tabIndex, bool isTablet, bool isDesktop) {
    final iconSize =
        isDesktop
            ? 120.0
            : isTablet
            ? 100.0
            : 80.0;
    final titleSize =
        isDesktop
            ? 24.0
            : isTablet
            ? 20.0
            : 18.0;
    final subtitleSize =
        isDesktop
            ? 16.0
            : isTablet
            ? 14.0
            : 12.0;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getEmptyStateIcon(tabIndex),
            size: iconSize,
            color: AppColors.textTertiary,
          ),
          SizedBox(height: isDesktop ? 24.0 : AppTheme.spacing16),
          Text(
            'No ${_tabTitles[tabIndex]} campaigns',
            style: AppTextStyles.headlineSmall.copyWith(
              fontSize: titleSize,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: isDesktop ? 12.0 : AppTheme.spacing8),
          Text(
            'Campaigns will appear here when available',
            style: AppTextStyles.bodyMedium.copyWith(
              fontSize: subtitleSize,
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

  Widget _buildCampaignCard(
    CampaignModel campaign,
    int index,
    bool isTablet,
    bool isDesktop,
  ) {
    final imageSize =
        isDesktop
            ? 120.0
            : isTablet
            ? 100.0
            : 120.0;
    final padding =
        isDesktop
            ? 24.0
            : isTablet
            ? 20.0
            : 16.0;
    final borderRadius =
        isDesktop
            ? 20.0
            : isTablet
            ? 18.0
            : 16.0;
    final tagHeight =
        isDesktop
            ? 40.0
            : isTablet
            ? 36.0
            : 32.0;

    return Card(
      margin: EdgeInsets.only(bottom: isDesktop ? 24.0 : AppTheme.spacing16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: InkWell(
        onTap: () => _showCampaignDetails(campaign, isTablet, isDesktop),
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Campaign Image (Left side)
              ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius * 0.75),
                child: SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.network(
                    campaign.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.background,
                        child: Icon(
                          Icons.image,
                          size: imageSize * 0.5,
                          color: AppColors.textTertiary,
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(width: padding),

              // Campaign Content (Right side)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company Name (Bold title)
                    Text(
                      campaign.companyName,
                      style: AppTextStyles.titleLarge.copyWith(
                        fontSize:
                            isDesktop
                                ? 22.0
                                : isTablet
                                ? 20.0
                                : 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: isDesktop ? 8.0 : AppTheme.spacing4),

                    // Description
                    Text(
                      campaign.description,
                      style: AppTextStyles.bodyMedium.copyWith(
                        fontSize:
                            isDesktop
                                ? 16.0
                                : isTablet
                                ? 15.0
                                : 14.0,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: isDesktop ? 3 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: isDesktop ? 16.0 : AppTheme.spacing12),

                    // Tags
                    SizedBox(
                      height: tagHeight,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: campaign.tags.length,
                        itemBuilder: (context, tagIndex) {
                          final tag = campaign.tags[tagIndex];
                          final tagString = tag;
                          return Container(
                            margin: EdgeInsets.only(
                              right:
                                  tagIndex < campaign.tags.length - 1
                                      ? (isDesktop ? 12.0 : AppTheme.spacing8)
                                      : 0,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: isDesktop ? 12.0 : 10.0,
                              vertical: isDesktop ? 6.0 : 4.0,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.textInverse.withValues(
                                alpha: 0.05,
                              ),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: AppColors.textInverse.withValues(
                                  alpha: 0.3,
                                ),
                                width: 1,
                              ),
                            ),
                            child: Text(
                              tagString,
                              style: AppTextStyles.bodySmall.copyWith(
                                fontSize: isDesktop ? 14.0 : 12.0,
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
      ),
    );
  }

  void _showCampaignDetails(
    CampaignModel campaign,
    bool isTablet,
    bool isDesktop,
  ) {
    final dialogWidth =
        isDesktop
            ? 600.0
            : isTablet
            ? 500.0
            : double.infinity;
    final titleSize =
        isDesktop
            ? 24.0
            : isTablet
            ? 20.0
            : 18.0;
    final contentSize =
        isDesktop
            ? 16.0
            : isTablet
            ? 15.0
            : 14.0;

    Get.dialog(
      AlertDialog(
        title: Text('Campaign Details', style: TextStyle(fontSize: titleSize)),
        content: SizedBox(
          width: dialogWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Company: ${campaign.companyName}',
                style: TextStyle(fontSize: contentSize),
              ),
              SizedBox(height: isDesktop ? 12.0 : AppTheme.spacing8),
              Text(
                'Description: ${campaign.description}',
                style: TextStyle(fontSize: contentSize),
              ),
              SizedBox(height: isDesktop ? 12.0 : AppTheme.spacing8),
              Text(
                'Status: ${campaign.status}',
                style: TextStyle(fontSize: contentSize),
              ),
              SizedBox(height: isDesktop ? 12.0 : AppTheme.spacing8),
              Text(
                'Tags: ${campaign.tags.join(', ')}',
                style: TextStyle(fontSize: contentSize),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Close', style: TextStyle(fontSize: contentSize)),
          ),
        ],
      ),
    );
  }
}
