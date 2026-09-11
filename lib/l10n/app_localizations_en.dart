// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusAccepted => 'Accepted';

  @override
  String get statusConfirmed => 'Confirmed';

  @override
  String get statusProcessing => 'Processing';

  @override
  String get statusPreparing => 'Preparing';

  @override
  String get statusHandover => 'Handover';

  @override
  String get statusReady => 'Ready';

  @override
  String get statusShipped => 'Shipped';

  @override
  String get statusDelivered => 'Delivered';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String get statusAwaitingCustomer => 'Awaiting Customer';

  @override
  String get statusAwaitingPayment => 'Awaiting Payment';

  @override
  String get statusPickedUp => 'Picked Up';

  @override
  String get statusFailed => 'Failed';

  @override
  String get statusPaymentFailed => 'Payment Failed';

  @override
  String get statusRefundRequested => 'Refund Requested';

  @override
  String get statusRefundRequestCanceled => 'Refund Request Canceled';

  @override
  String get statusRefunded => 'Refunded';

  @override
  String get statusUnknown => 'Unknown';
}
