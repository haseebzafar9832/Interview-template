class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // App Information
  static const String appName = 'MY FLYN';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'A Flutter application with clean architecture using GetX';

  // Korean Text Constants
  static const String koreanGreeting = '안녕하세요,';
  static const String koreanGreeting1 = '홍길동님';
  static const String myAccount = '나의 캠페인';

  static const String koreanImageRegistration = '이미지 등록';
  static const String koreanMyMatching = '나의 매칭';
  static const String koreanApplication = '신청';
  static const String koreanInProgress = '진행중';
  static const String koreanCompleted = '완료';
  static const String koreanMyInformation = '내 정보';
  static const String koreanNotices = '공지사항';
  static const String koreanOneOnOneInquiry = '1:1 문의';
  static const String koreanFAQ = 'FAQ';
  static const String koreanTermsAndPolicies = '약관 및 정책';
  static const String koreanLogout = '로그아웃';
  static const String koreanMembershipWithdrawal = '회원탈퇴';
  static const String koreanCampaignMatching = '캠페인 매칭';
  static const String koreanBasicInformation = '기본정보';
  static const String koreanPasswordSettings = '비밀번호 설정';
  static const String koreanInterestCategories = '관심 카테고리';
  static const String koreanID = '아이디';
  static const String koreanEmail = '이메일';
  static const String koreanMobilePhone = '휴대폰 번호';
  static const String koreanAuthenticate = '인증하기';
  static const String koreanNickname = '닉네임';
  static const String koreanInstagramID = '인스타그램 아이디';
  static const String koreanRepresentativeWorkURL = '대표 작업물 URL';
  static const String koreanPortfolio = '포트폴리오';
  static const String koreanSave = '저장하기';
  static const String koreanComplete = '완료';
  static const String koreanCurrentPassword = '기존 비밀번호';
  static const String koreanNewPassword = '새 비밀번호';
  static const String koreanConfirmPassword = '비밀번호 확인';
  static const String koreanPasswordPlaceholder = '8-16자 영문, 숫자, 특수문자 조합';
  static const String koreanPasswordConfirmPlaceholder = '비밀번호를 다시 입력해주세요.';
  static const String koreanSubjectPlaceholder = '피사체에 나라는 자리';

  // Animation Durations
  static const Duration animationDurationFast = Duration(milliseconds: 200);
  static const Duration animationDurationNormal = Duration(milliseconds: 300);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);

  // API Constants
  static const int apiTimeoutSeconds = 30;
  static const int apiMaxRetries = 3;

  // Storage Keys
  static const String storageKeyUserToken = 'user_token';
  static const String storageKeyUserData = 'user_data';
  static const String storageKeyThemeMode = 'theme_mode';
  static const String storageKeyLanguage = 'language';

  // Validation Constants
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 16;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 50;

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Cache
  static const Duration cacheExpiration = Duration(hours: 24);

  // Error Messages
  static const String genericErrorMessage =
      'Something went wrong. Please try again.';
  static const String networkErrorMessage =
      'Network error. Please check your connection.';
  static const String timeoutErrorMessage =
      'Request timeout. Please try again.';
  static const String unauthorizedErrorMessage =
      'Unauthorized access. Please login again.';

  // Success Messages
  static const String genericSuccessMessage =
      'Operation completed successfully.';
  static const String loginSuccessMessage = 'Login successful.';
  static const String logoutSuccessMessage = 'Logout successful.';

  // Permission Messages
  static const String cameraPermissionMessage =
      'Camera permission is required to take photos.';
  static const String storagePermissionMessage =
      'Storage permission is required to save files.';
  static const String locationPermissionMessage =
      'Location permission is required for location features.';
  static const String microphonePermissionMessage =
      'Microphone permission is required for audio features.';
}
