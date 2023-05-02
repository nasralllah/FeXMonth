class prducts {
  final int id;
  final String Slug;
  final String product_url;
  final String picture_url;
  final bool is_saved;
  final ChildModel attributes;
  final childStore store;

  prducts(
      {
        required this.Slug,
        required this.id,
      required this.attributes,
      required this.store,
      required this.product_url,
      required this.picture_url,
      required this.is_saved});

  factory prducts.fromJson(Map<String, dynamic> json) => prducts(
      id: json['id'],
      product_url: json['product_url'],
      picture_url: json["picture_url"],
      is_saved: json['is_saved'],
      attributes: ChildModel.fromjson(json['attributes'],),
      store: childStore.fromjson(json['store']),
      Slug: json['slug']);
}

class ChildModel {
  final String title;
  final int price;
  final String Discount;
  final String status;
   var cost;
   final id;

  ChildModel( {
    required this.title,
    required this.price,
    required this.Discount,
    required this.status,
    required this.cost,
    required this.id,
  });
  factory ChildModel.fromjson(Map<String, dynamic> json) => ChildModel(
      title: json['title'],
      price: json['price'],
      Discount: json['discount'],
      status: json['status'],
      cost: json['cost'], id: json['id']);
}

class childStore {
  final int id;
  final String Store_Name;

  childStore({required this.id, required this.Store_Name});
  factory childStore.fromjson(Map<String, dynamic> json) =>
      childStore(id: json['id'], Store_Name: json['name']);
}
