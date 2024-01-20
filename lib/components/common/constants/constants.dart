
enum OrderStatus {
  pending,
  approved,
  rejected,
  cancelled,
  completed,
}

class Const {
  static const String PENDING_ORDER_STATUS = 'pending';
  static const String APPROVED_ORDER_STATUS = 'approved';
  static const String REJECTED_ORDER_STATUS = 'rejected';
  static const String CANCELLED_ORDER_STATUS = 'cancelled';
  static const String COMPLETED_ORDER_STATUS = 'completed';

  static Map<OrderStatus, String> orderStatusMap = {
  OrderStatus.pending :  PENDING_ORDER_STATUS,
   OrderStatus.approved : APPROVED_ORDER_STATUS,
   OrderStatus.rejected : REJECTED_ORDER_STATUS,
    OrderStatus.cancelled :CANCELLED_ORDER_STATUS,
    OrderStatus.completed :COMPLETED_ORDER_STATUS,
  };
}