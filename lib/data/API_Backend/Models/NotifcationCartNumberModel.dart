// ignore_for_file: file_names

class CartNumber{
  final int count;

  CartNumber({required this.count});
  factory CartNumber.fromJson(Map<String,dynamic> json) =>
      CartNumber(
        count: json['count']
      );
}