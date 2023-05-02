
class StoresDisplay{
  final int id;
  final ChildModelattributes attributes;
  final ChildModelrates rates;
  final ChildModelcategory category;
  final ChildModelprofile profile;

  StoresDisplay({required this.id, required this.attributes,required this.rates,required this.category,required this.profile});
  factory StoresDisplay.fromjson(Map<String,dynamic>json) =>
      StoresDisplay(
          id:json['id'],
          attributes: ChildModelattributes.fromjson(json['attributes']),
          rates: ChildModelrates.fromjson(json['rates']),
          category: ChildModelcategory.fromjson(json['category']),
              profile: ChildModelprofile.fromjson(json['profile'])
          );

}

class ChildModelattributes{
  final String storename;
  final String name;
  final int documented;

  ChildModelattributes({required this.storename, required this.name, required this.documented});
  factory ChildModelattributes.fromjson(Map<String,dynamic>json) =>
      ChildModelattributes(
          storename:json['storename'] ,
          name:json['name'] ,
          documented: json['documented']);
}
class ChildModelprofile{
  final String logourl;
  final String backgroundurl;

  ChildModelprofile({required this.logourl, required this.backgroundurl});
  factory ChildModelprofile.fromjson(Map<String,dynamic>json) =>
      ChildModelprofile(
          logourl:json['logo'] ,
          backgroundurl:json['background'] ,
        );
}


class ChildModelrates{
  final int number;
  final int rate;

  ChildModelrates({required this.number, required this.rate});
  factory ChildModelrates.fromjson(Map<String,dynamic>json) =>
      ChildModelrates(
        number:json['number'] ,
        rate:json['rate'] ,
      );
}

class ChildModelcategory{
  final int id;
  final String name;

  ChildModelcategory({required this.id, required this.name});
  factory ChildModelcategory.fromjson(Map<String,dynamic>json) =>
      ChildModelcategory(
        id:json['id'] ,
        name:json['name'] ,
      );
}
