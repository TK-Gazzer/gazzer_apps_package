
class OrderHistory {
  final String? operation;
  final String? userType;
  final String? createdAt;

  OrderHistory({this.operation, this.userType, this.createdAt});
  factory OrderHistory.fromJson(Map<String, dynamic> json) {
    return OrderHistory(
      operation: json['history'] as String?,
      userType: json['user_type'] as String?, // user - admin - vendor
      createdAt: json['created_at'] as String?,
    );
  }
}