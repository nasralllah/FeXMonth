// ignore_for_file: file_names, prefer_typing_uninitialized_variables

class CartTotalModel{
  var total;

  CartTotalModel({required this.total});
  factory CartTotalModel.fromJson(Map<String,dynamic> json) =>
      CartTotalModel(
          total: json['total']
      );
}