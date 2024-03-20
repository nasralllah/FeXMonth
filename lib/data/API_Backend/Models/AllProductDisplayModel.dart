// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

class AllProductDisplayModel{
  final int id;
  final String slug;
  final String product_url;
  final String picture_url;
  final bool is_saved;
  final Childattributes attributes;
  final Childstore store;
  final Childrates rates;
  final Childcomments comments;
  final String? status;


  AllProductDisplayModel( {
   required this.is_saved,required  this.status, required this.comments, required this.rates,required this.store, required this.id, required this.slug, required this.product_url, required this.picture_url, required this.attributes});
  factory AllProductDisplayModel.fromjson(Map<String,dynamic> json) =>
      AllProductDisplayModel(
          id: json['id'],
          slug: json['slug'],
          product_url: json['product_url'],
          picture_url: json['picture_url'],
          attributes: Childattributes.fromjson(json['attributes']),
        store: Childstore.fromjson(json['store']),
        rates: Childrates.fromjson(json['rates']),
        comments: Childcomments.fromjson(json['comments']),
        is_saved: json['is_saved'],
          status: json['status']

      );
}

class Childattributes{
  final String title;
  final int price;
   var discount;
  final int? cost;

  Childattributes({required this.title,required  this.price,required  this.discount,required  this.cost});
  factory Childattributes.fromjson(Map<String,dynamic>json) =>
      Childattributes(
          title: json['title'],
          price: json['price'],
          discount: json['discount'],
          cost: json['cost'],
      );

}

class Childstore{
  final int id;
  final String name;

  Childstore({required this.id,required this.name});
  factory Childstore.fromjson(Map<String,dynamic>json)=>
      Childstore(
          id: json['id'],
          name: json['name']

      );


}

class Childrates{
  final int number;
  var rate;

  Childrates({required this.number, required this.rate});
  factory Childrates.fromjson(Map<String,dynamic>json)=>
      Childrates(
          number: json['number'],
          rate: json['rate']

      );

}
class Childcomments{
  final int number;
  Childcomments({required this.number});
  factory Childcomments.fromjson(Map<String,dynamic>json)=>
      Childcomments(
        number: json['number']
      );

}