// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحباً بالعالم!';

  @override
  String get statusPending => 'قيد الانتظار';

  @override
  String get statusAccepted => 'تم القبول';

  @override
  String get statusConfirmed => 'مؤكد';

  @override
  String get statusProcessing => 'قيد المعالجة';

  @override
  String get statusPreparing => 'جاري التحضير';

  @override
  String get statusHandover => 'تسليم';

  @override
  String get statusReady => 'جاهز';

  @override
  String get statusShipped => 'تم الشحن';

  @override
  String get statusDelivered => 'تم التوصيل';

  @override
  String get statusCancelled => 'ملغي';

  @override
  String get statusAwaitingCustomer => 'في انتظار العميل';

  @override
  String get statusAwaitingPayment => 'في انتظار الدفع';

  @override
  String get statusPickedUp => 'تم الاستلام';

  @override
  String get statusFailed => 'فشل';

  @override
  String get statusPaymentFailed => 'فشل الدفع';

  @override
  String get statusRefundRequested => 'تم طلب استرجاع';

  @override
  String get statusRefundRequestCanceled => 'تم إلغاء طلب الاسترجاع';

  @override
  String get statusRefunded => 'تم الاسترجاع';

  @override
  String get statusUnknown => 'غير معروف';

  @override
  String get fromVendor => 'From Vendor';

  @override
  String get fromUser => 'From You';

  @override
  String get fromAdmin => 'From Admin';
}
