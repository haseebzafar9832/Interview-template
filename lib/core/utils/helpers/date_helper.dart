/// Helper class for date operations
class DateHelper {
  /// Format a date to a readable string
  static String formatDate(DateTime date, {String? pattern}) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    
    switch (pattern) {
      case 'dd/MM/yyyy':
        return '$day/$month/$year';
      case 'MM/dd/yyyy':
        return '$month/$day/$year';
      case 'yyyy-MM-dd':
        return '$year-$month-$day';
      default:
        return '$day/$month/$year';
    }
  }
  
  /// Format a date to show relative time (e.g., "2 hours ago")
  static String formatRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }
  
  /// Check if a date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && 
           date.month == now.month && 
           date.day == now.day;
  }
  
  /// Check if a date is yesterday
  static bool isYesterday(DateTime date) {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return date.year == yesterday.year && 
           date.month == yesterday.month && 
           date.day == yesterday.day;
  }
  
  /// Get the start of the day
  static DateTime startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
  
  /// Get the end of the day
  static DateTime endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }
  
  /// Get the start of the week
  static DateTime startOfWeek(DateTime date) {
    final weekday = date.weekday;
    return date.subtract(Duration(days: weekday - 1));
  }
  
  /// Get the end of the week
  static DateTime endOfWeek(DateTime date) {
    final weekday = date.weekday;
    final daysUntilEnd = 7 - weekday;
    return date.add(Duration(days: daysUntilEnd));
  }
  
  /// Get the start of the month
  static DateTime startOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }
  
  /// Get the end of the month
  static DateTime endOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }
  
  /// Check if a date is in the current week
  static bool isCurrentWeek(DateTime date) {
    final now = DateTime.now();
    final startOfCurrentWeek = startOfWeek(now);
    final endOfCurrentWeek = endOfWeek(now);
    
    return date.isAfter(startOfCurrentWeek.subtract(const Duration(days: 1))) &&
           date.isBefore(endOfCurrentWeek.add(const Duration(days: 1)));
  }
  
  /// Check if a date is in the current month
  static bool isCurrentMonth(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month;
  }
  
  /// Get the age from birth date
  static int calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    
    if (now.month < birthDate.month || 
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    
    return age;
  }
  
  /// Check if a year is a leap year
  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }
  
  /// Get the number of days in a month
  static int daysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }
}
