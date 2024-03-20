import 'dart:convert';

class productsDetails{
  final int id;
  final childStoree store;
  final List<String> pictures;
  final childattributes attributes;
  final childlinks links;


  productsDetails({
    required this.id,
    required this.store,
    required this.pictures,
    required this.attributes,
    required this.links,

});
  factory productsDetails.fromjson(Map<String,dynamic>json){
    var picturesFromJson = json['pictures'];
    List<String> PictureList = picturesFromJson.cast<String>();
    return productsDetails(
        id: json['id'],
        store: childStoree.fromjson(json['store']),
        pictures: /*childPicture.fromjson(json['pictures']),*/PictureList,
        attributes: childattributes.fromjson(json['attributes']),
        links: childlinks.fromjson(json['links'])
    );}

}

class childStoree {
  final int storeId;
  final String storeName;
  final int storeCategoryId;
  final String category_Name;

  childStoree({
    required this.storeId,
    required this.storeName,
    required this.storeCategoryId,
    required this.category_Name
  });

  factory childStoree.fromjson(Map<String , dynamic>json)=>
      childStoree(
          storeId: json['store_id'],
          storeName: json['store_name'],
          storeCategoryId: json['store_category_id'],
          category_Name: json['store_category_name']
      );


}
/*
class childPicture {
  final List<String> pictures;

  childPicture({ required this.pictures});
  factory childPicture.fromjson(Map<String, dynamic>json)=>
      childPicture(pictures: json['pictures']);
}*/

class childUrl {
  final String url;
  childUrl({required this.url});
  factory childUrl.fromjson(Map<String , dynamic> json)=>
      childUrl(url: json['url']);
}



class childlinks {
  final String variants;
  final String comments;
  final String rating;
  final String add_to_cart;

  childlinks({
     required this.variants,
     required this.comments,
     required this.rating,
     required this.add_to_cart
  });
  factory childlinks.fromjson(Map<String,dynamic>json)=>
    childlinks(
        variants: json['variants'],
        comments: json['comments'],
        rating: json['rating'],
        add_to_cart: json['add_to_cart']
    );
}

class childattributes {
  final String title;
  final String description;
  final double price;

  childattributes({
   required this.title,
    required  this.description,
    required this.price});
  factory childattributes.fromjson(Map<String , dynamic> json)=>
      childattributes(
          title: json['title'],
          description: json['description'],
          price: json['price']
      );
}

/*

class prudoctDetails{
  final int id;
  prudoctDetails({required this.id});

  factory prudoctDetails.fromjson(Map<List,dynamic>json) =>
      prudoctDetails(id: json['id']);

}*/
