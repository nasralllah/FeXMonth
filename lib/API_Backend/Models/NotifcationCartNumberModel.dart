class CartNumber{
  final int count;

  CartNumber({required this.count});
  factory CartNumber.fromJson(Map<String,dynamic> json) =>
      CartNumber(
        count: json['count']
      );
}