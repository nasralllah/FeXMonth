class Order {
  final String code;
  final String status;
  final String shippingType;
  final double cost;
  final double shippingCost;
  final double discount;
  final double totalCost;
  final String createdAt;

  Order({
    required this.code,
    required this.status,
    required this.shippingType,
    required this.cost,
    required this.shippingCost,
    required this.discount,
    required this.totalCost,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      code: json['code'],
      status: json['status'],
      shippingType: json['shipping_type'],
      cost: json['cost'].toDouble(),
      shippingCost: json['shipping_cost'].toDouble(),
      discount: json['discount'].toDouble(),
      totalCost: json['total_cost'].toDouble(),
      createdAt: json['created_at'],
    );
  }
}
