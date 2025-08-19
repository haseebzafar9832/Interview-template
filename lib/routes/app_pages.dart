import 'package:get/get.dart';
import '../presentation/pages/splash/splash_page.dart';
import '../presentation/pages/home/home_page.dart';
import '../presentation/pages/campaign/campaign_matching_page.dart';
import '../presentation/bindings/home_binding.dart';
import 'app_routes.dart';

/// App pages configuration
class AppPages {
  // Private constructor to prevent instantiation
  AppPages._();

  // Page list for GetMaterialApp
  static final List<GetPage> pages = [
    // Splash route
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // Initial route
    GetPage(
      name: AppRoutes.initial,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),

    // Home route
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // Dashboard route

    // Campaign matching route
    GetPage(
      name: AppRoutes.campaignMatching,
      page: () => const CampaignMatchingPage(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
