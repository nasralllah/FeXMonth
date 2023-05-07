class CreatOrderModel {
  final childData data;
  final String coupon;
  final int cost;
  final int shipping_cost;
  final int discount;
  final int total_cost;
  final int created_at;

  CreatOrderModel(
      {required this.data,
      required this.coupon,
      required this.cost,
      required this.shipping_cost,
      required this.discount,
      required this.total_cost,
      required this.created_at});

  factory CreatOrderModel.fromjson(Map<String, dynamic> json) => CreatOrderModel(
      data: childData.fromjson(json['data']),
      coupon: json['coupon'],
      cost: json['cost'],
      shipping_cost: json['shipping_cost'],
      discount: json['discount'],
      total_cost: json['total_cost'],
      created_at: json['created_at']);
}

class childData {
  final String code;
  final String status;
  final childaddress address;

  childData({required this.code, required this.status, required this.address});
  factory childData.fromjson(Map<String, dynamic> json) => childData(
      code: json['code'],
      status: json['status'],
      address: childaddress.fromjson(json['address']));
}

class childaddress {
  final int id;
  final String type;
  final String name;
  final String country;
  final String city;
  final String phone_number;
  final String address;
  final String description;
  final String log;
  final String lut;

  childaddress({
    required this.id,
    required this.type,
    required this.name,
    required this.country,
    required this.city,
    required this.phone_number,
    required this.address,
    required this.description,
    required this.log,
    required this.lut,
  });
  factory childaddress.fromjson(Map<String, dynamic> json) => childaddress(
      id: json['id'],
      type: json['type'],
      name: json['name'],
      country: json['country'],
      city: json['city'],
      phone_number: json['phone_number'],
      address: json['address'],
      description: json['description'],
      log: json['log'],
      lut: json['lut']);
}
