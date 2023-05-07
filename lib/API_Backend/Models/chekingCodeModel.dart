class CheekingCodeModel{
  final String status;
  final String message;
  final data  Data;

  CheekingCodeModel({required this.status,required this.message,required this.Data});
  factory CheekingCodeModel.fromjson(Map<String,dynamic> json)=>
      CheekingCodeModel(
          status:  json['status'],
          message:  json['message'],
          Data:  data.fromjson(json['data'])
      );
}

class data{
  final int coupon_id;
  final String coupon_code;
  final String status;
  final int discount;
  final String end_at;

  data({required this.coupon_id,required this.coupon_code,required this.status,required this.discount,
    required this.end_at});
  factory data.fromjson(Map<String,dynamic> json)=>
      data(
          coupon_id: json['coupon_id'],
          coupon_code:  json['coupon_code'],
          status:  json['status'],
          discount:  json['discount'],
          end_at:  json['end_at']
      );
}