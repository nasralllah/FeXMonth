
class Cateogory{
  final int id;
  final ChildModel attributes;
  Cateogory(
      {
    required this.id,
    required this.attributes

  });

  factory Cateogory.fromjson(Map<String , dynamic> json)=>
  Cateogory(id: json['id'], attributes: ChildModel.fromjson(json['attributes']),);

}

class ChildModel {
  final String category_name;
  ChildModel({required this.category_name});
  factory ChildModel.fromjson(Map<String,dynamic> json)=>
      ChildModel(category_name: json['category_name']);
}