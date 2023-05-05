class CartDisplayModel {
  final int id;
  final int quantity;
  var net_cost;
  var  total;
  final chidlproduct product;
  final childstore store;

  CartDisplayModel(
      {required this.id,
      required this.quantity,
      required this.net_cost,
      required this.total,
      required this.product,
      required this.store});
  factory CartDisplayModel.fromJson(Map<String, dynamic> json) =>
      CartDisplayModel(
          id: json['id'],
          quantity: json['quantity'],
          net_cost: json['net_cost'],
          total: json['total'],
          product: chidlproduct.fromjson(json['product']),
          store: childstore.fromjson(json['store']));
}

class chidlproduct {
  final int id;
  final String slug;
  final String title;
  final int price;
  final int has_options;
  final String picture;
  var discount;

  chidlproduct(
      {required this.id,
      required this.slug,
      required this.title,
      required this.price,
      required this.has_options,
      required this.picture,
      required this.discount});
  factory chidlproduct.fromjson(Map<String, dynamic> json) => chidlproduct(
      id: json['id'],
      slug: json['slug'],
      title: json['title'],
      price: json['price'],
      has_options: json['has_options'],
      picture: json['picture'],
      discount: json['discount']
  );
}

class childstore {
  final int id;
  final String name;

  childstore({required this.id, required this.name});
  factory childstore.fromjson(Map<String, dynamic> json) =>
      childstore(id: json['id'], name: json['name']);
}
