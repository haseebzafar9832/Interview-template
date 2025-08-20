import 'package:get/get.dart';
import '../../core/constants/app_constants.dart';

/// Home controller for managing home screen logic
class HomeController extends GetxController {
  // Observable variables
  final RxBool isLoading = false.obs;

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

  /// Set loading state
  void setLoading(bool loading) {
    isLoading.value = loading;
  }

  /// Refresh home data
  Future<void> refreshData() async {
    await _initializeHomeData();
  }
}
