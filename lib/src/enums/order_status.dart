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
  String get label {
    switch (this) {
      case OrderStatus.pending:
        return L10n.tr().statusPending;
      case OrderStatus.awaitingCustomer:
        return L10n.tr().statusAwaitingCustomer;
      case OrderStatus.waitingPayment:
        return L10n.tr().statusAwaitingPayment;
      case OrderStatus.confirmed:
        return L10n.tr().statusConfirmed;
      case OrderStatus.preparing:
        return L10n.tr().statusPreparing;
      case OrderStatus.processing:
        return L10n.tr().statusProcessing;
      case OrderStatus.handover:
        return L10n.tr().statusHandover;
      case OrderStatus.accepted:
        return L10n.tr().statusAccepted;
      case OrderStatus.pickedUp:
        return L10n.tr().statusPickedUp;
      case OrderStatus.delivered:
        return L10n.tr().statusDelivered;
      case OrderStatus.cancelled:
        return L10n.tr().statusCancelled;
      case OrderStatus.failed:
        return L10n.tr().statusFailed;
      case OrderStatus.paymentFailed:
        return L10n.tr().statusPaymentFailed;
      case OrderStatus.refundRequested:
        return L10n.tr().statusRefundRequested;
      case OrderStatus.refundRequestCanceled:
        return L10n.tr().statusRefundRequestCanceled;
      case OrderStatus.refunded:
        return L10n.tr().statusRefunded;
      case OrderStatus.unknown:
        return L10n.tr().statusUnknown;
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
