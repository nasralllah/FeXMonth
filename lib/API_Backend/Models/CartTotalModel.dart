class CartTotalModel{
  var total;

  CartTotalModel({required this.total});
  factory CartTotalModel.fromJson(Map<String,dynamic> json) =>
      CartTotalModel(
          total: json['total']
      );
}