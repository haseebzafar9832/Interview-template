import 'package:flutter/material.dart';

/// Extensions on BuildContext for common operations
extension ContextExtensions on BuildContext {
  /// Get the current theme
  ThemeData get theme => Theme.of(this);
  
  /// Get the current color scheme
  ColorScheme get colorScheme => theme.colorScheme;
  
  /// Get the current text theme
  TextTheme get textTheme => theme.textTheme;
  
  /// Get the current media query
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  
  /// Get the screen size
  Size get screenSize => mediaQuery.size;
  
  /// Get the screen width
  double get screenWidth => screenSize.width;
  
  /// Get the screen height
  double get screenHeight => screenSize.height;
  
  /// Check if the screen is in portrait mode
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;
  
  /// Check if the screen is in landscape mode
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
  
  /// Get the status bar height
  double get statusBarHeight => mediaQuery.padding.top;
  
  /// Get the bottom padding (safe area)
  double get bottomPadding => mediaQuery.padding.bottom;
  
  /// Get the left padding (safe area)
  double get leftPadding => mediaQuery.padding.left;
  
  /// Get the right padding (safe area)
  double get rightPadding => mediaQuery.padding.right;
  
  /// Check if the device is a tablet
  bool get isTablet => screenWidth > 600;
  
  /// Check if the device is a phone
  bool get isPhone => screenWidth <= 600;
  
  /// Show a snackbar
  void showSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }
  
  /// Show an error snackbar
  void showErrorSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: duration ?? const Duration(seconds: 4),
      ),
    );
  }
  
  /// Show a success snackbar
  void showSuccessSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: duration ?? const Duration(seconds: 3),
      ),
    );
  }
  
  /// Navigate to a named route
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }
  
  /// Navigate to a named route and replace current route
  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed<T, void>(routeName, arguments: arguments);
  }
  
  /// Navigate to a named route and clear all previous routes
  Future<T?> pushNamedAndRemoveUntil<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
  
  /// Go back to previous route
  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }
  
  /// Check if can go back
  bool get canPop => Navigator.of(this).canPop();
}
