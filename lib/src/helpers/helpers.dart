import 'package:gazzer_apps/gazzer_apps.dart';
import 'package:gazzer_apps/src/models/order_history.dart';

abstract class Helpers {

String getFormattedTimeAndUser(OrderHistory history) {
    String timeStr = '';
    if (history.createdAt != null && history.createdAt!.isNotEmpty) {
      timeStr = Helpers.convertStringToTime(history.createdAt ?? '');
    }
    String userStr = '';
    switch (history.userType?.toLowerCase()) {
      case 'vendor':
        userStr = L10n.tr().fromVendor;
        break;
      case 'user':
        userStr = L10n.tr().fromUser;
        break;
      case 'admin':
        userStr = L10n.tr().fromAdmin;
        break;
      default:
        userStr = history.userType ?? '';
    }
    if (timeStr.isEmpty) return userStr;
    if (userStr.isEmpty) return timeStr;
    return '$timeStr ٠ $userStr';
  }

   static String convertStringToTime(String timeStr ) {
    if (timeStr.isEmpty) return '';
    
      try {
      final date = DateTime.parse(timeStr).toLocal();
      int hour = date.hour;
      final minute = date.minute.toString().padLeft(2, '0');
      final amPm = hour >= 12 ? 'م' : 'ص';
      hour = hour % 12;
      if (hour == 0) hour = 12;
      timeStr = '$hour:$minute $amPm';
    } catch (_) {
      timeStr = timeStr;
    }
    return timeStr;
  }

}
