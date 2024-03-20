class SingleProductModel{

final int id;
final /*List<dynamic>*/ pictures;
final Childstore store;
final Childattributes attributes;
final Childlinks links;

SingleProductModel( {required this.pictures,required this.id, required this.store,required this.attributes,required this.links});
factory SingleProductModel.fromJson(Map<String,dynamic> json){
  var ClassFromJson = json['pictures'];
  List<String> ClassList = ClassFromJson.cast<String>();
  return SingleProductModel(

      id: json['id'],
      attributes: Childattributes.fromJson(json['attributes']),
      links: Childlinks.fromJson(json['links']),
      store: Childstore.fromJson(json['store']),
      pictures: json['pictures']
  );
}

}

class Childstore{
  final int store_id;
  final String store_name;
  final int store_category_id;
  final String store_category_name;

  Childstore( {required this.store_id, required this.store_name,required this.store_category_id,
    required this.store_category_name});
  factory Childstore.fromJson(Map<String,dynamic>json)=>
      Childstore(
          store_id: json['store_id'],
          store_name: json['store_name'],
          store_category_id: json['store_category_id'],
          store_category_name: json['store_category_name']);
}

class Childattributes{
  final String title;
  final String description;
  final int price;
  final double discount;
  final bool has_option;

  Childattributes( {required this.discount,required this.has_option,required this.title, required this.description,required this.price});
  factory Childattributes.fromJson(Map<String,dynamic>json)=>
      Childattributes(
        title: json['title'],
        description: json['description'],
        price: json['price'],
        discount: json['discount'],
        has_option: json['has_option']
      );

}

class Childlinks{
  final String variants;
  final String comments;
  final String rating;
  final String add_to_cart;

  Childlinks( {required this.variants, required this.comments,required this.rating,
    required this.add_to_cart});
  factory Childlinks.fromJson(Map<String,dynamic>json)=>
      Childlinks(
        add_to_cart: json['add_to_cart'],
        comments: json['comments'],
        rating: json['rating'],
        variants: json['variants']
      );

}