import 'package:flutter/material.dart';
import 'package:gazzer_apps/gazzer_apps.dart';

enum OrderStatus {
  pending,
  waitingPayment,
  confirmed,
  preparing,
  pickedUp,
  delivered,
  cancelled,
  failed,
  paymentFailed,
  refundRequested,
  refundRequestCanceled,
  refunded,
  awaitingCustomer,
  unknown,
  accepted,
  handover,
  processing,
}

OrderStatus getOrderStatus(String orderStatus) {
  switch (orderStatus.toLowerCase()) {
    case 'pending':
      return OrderStatus.pending;
    case 'waiting_payment':
    case 'awaiting_payment':
      return OrderStatus.waitingPayment;
    case 'picked_up':
      return OrderStatus.pickedUp;
    case 'awaiting_customer':
      return OrderStatus.awaitingCustomer;
    case 'processing':
      return OrderStatus.processing;
    case 'preparing':
      return OrderStatus.preparing;
    case 'handover':
      return OrderStatus.handover;
    case 'accepted':
      return OrderStatus.accepted;
    case 'confirmed':
      return OrderStatus.confirmed;
    case 'delivered':
      return OrderStatus.delivered;
     case 'canceled': 
    case 'cancelled':
      return OrderStatus.cancelled;
    case 'failed':
      return OrderStatus.failed;
    case 'payment_failed':
      return OrderStatus.paymentFailed;
    case 'refund_requested':
      return OrderStatus.refundRequested;
    case 'refund_request_cancelled':
      return OrderStatus.refundRequestCanceled;
    case 'refunded':
      return OrderStatus.refunded;
    default:
      return OrderStatus.unknown;
  }
}

extension OrderStatusExtension on OrderStatus {
  String  label (context){
    switch (this) {
      case OrderStatus.pending:
      return AppLocalizations.of(context)?.statusPending ?? 'Pending';
      case OrderStatus.awaitingCustomer:
      return AppLocalizations.of(context)?.statusAwaitingCustomer ?? 'Awaiting Customer';
      case OrderStatus.waitingPayment:
       return AppLocalizations.of(context)?.statusAwaitingPayment ?? 'Waiting Payment';
      case OrderStatus.confirmed:
       return AppLocalizations.of(context)?.statusConfirmed ?? 'Confirmed';

      case OrderStatus.preparing:
       return AppLocalizations.of(context)?.statusPreparing ?? 'Preparing';
      case OrderStatus.processing:
       return AppLocalizations.of(context)?.statusProcessing ?? 'Processing';
      case OrderStatus.handover:
       return AppLocalizations.of(context)?.statusHandover ?? 'Handover';  

      case OrderStatus.accepted:
       return AppLocalizations.of(context)?.statusAccepted ?? 'Accepted';
      case OrderStatus.pickedUp:
       return AppLocalizations.of(context)?.statusPickedUp ?? 'Picked Up';

      case OrderStatus.delivered:
        return AppLocalizations.of(context)?.statusDelivered ?? 'Delivered';
      case OrderStatus.cancelled:
        return AppLocalizations.of(context)?.statusCancelled ?? 'Cancelled';
      case OrderStatus.failed:
        return AppLocalizations.of(context)?.statusFailed ?? 'Failed';
      case OrderStatus.paymentFailed:
        return AppLocalizations.of(context)?.statusPaymentFailed ?? 'Payment Failed';
      case OrderStatus.refundRequested:
        return AppLocalizations.of(context)?.statusRefundRequested ?? 'Refund Requested';
      case OrderStatus.refundRequestCanceled:
        return AppLocalizations.of(context)?.statusRefundRequestCanceled ?? 'Refund Request Canceled';
      case OrderStatus.refunded:
        return AppLocalizations.of(context)?.statusRefunded ?? 'Refunded';
      case OrderStatus.unknown:
        return AppLocalizations.of(context)?.statusUnknown ?? 'Unknown';
    }
  }

  Color get badgeColor {
    switch (this) {
      case OrderStatus.pending:
        return const Color(0xFFE3F2FD);
      case OrderStatus.waitingPayment:
        return Colors.red;
      case OrderStatus.awaitingCustomer:
        return const Color(0xFFFFF3E0);
      case OrderStatus.confirmed:
        return const Color(0xFFFFF3E0);
      case OrderStatus.preparing:
        return const Color(0xFFFFF3E0);
      case OrderStatus.processing:
        return const Color(0xFFFFF3E0);
      case OrderStatus.handover:
        return const Color(0xFFFFF3E0);
      case OrderStatus.accepted:
        return const Color(0xFFFFF3E0);
      case OrderStatus.pickedUp:
        return const Color(0xFFFFF3E0);
      case OrderStatus.delivered:
        return const Color(0xFFE8F5E9);
      case OrderStatus.cancelled:
        return const Color(0xFFFFE1E1);
      case OrderStatus.failed:
        return const Color(0xFFFFE1E1);
      case OrderStatus.paymentFailed:
        return const Color(0xFFFFE1E1);
      case OrderStatus.refundRequested:
        return const Color(0xFFFFF3E0);
      case OrderStatus.refundRequestCanceled:
        return const Color(0xFFFFE1E1);
      case OrderStatus.refunded:
        return const Color(0xFFE8F5E9);
      case OrderStatus.unknown:
        return const Color(0xFFC6C0C0);
    }
  }
}
