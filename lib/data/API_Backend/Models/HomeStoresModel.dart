// ignore_for_file: file_names

class HomeStores {
  final int id;
  final ChilldModelattributes attributes;
  final ChilldModelprofile profile;
  final ChilldModelrates rates;
  final ChilldModelcategory category;

  HomeStores(
      {
        required this.id,
      required this.attributes,
      required this.profile,
      required this.category,
       required this.rates
      });
  factory HomeStores.fromJson(Map<String, dynamic> json) => HomeStores(
        id: json['id'],
        attributes: ChilldModelattributes.fromJson(json['attributes']),
        profile: ChilldModelprofile.fromJson(json['profile']),
        category: ChilldModelcategory.fromJson(json['category']),
        rates: ChilldModelrates.fromJson(json['rates']),
      );
}

class ChilldModelattributes {
  final String storename;
  final String name;
  final int documented;

  ChilldModelattributes(
      {required this.storename, required this.name, required this.documented});
  factory ChilldModelattributes.fromJson(Map<String, dynamic> json) =>
      ChilldModelattributes(
          storename: json['storename'],
          name: json['name'],
          documented: json['documented']);
}

class ChilldModelprofile {
  final String logourl;
  final String backgroundurl;

  ChilldModelprofile({required this.logourl, required this.backgroundurl});
  factory ChilldModelprofile.fromJson(Map<String, dynamic> json) =>
      ChilldModelprofile(
        logourl: json['logo'],
        backgroundurl: json['background'],
      );
}

class ChilldModelrates {
  final int number;
  final int rate;

  ChilldModelrates({required this.number, required this.rate});
  factory ChilldModelrates.fromJson(Map<String, dynamic> json) =>
      ChilldModelrates(
        number: json['number'],
        rate: json['rate'],
      );
}

class ChilldModelcategory {
  final int id;
  final String name;

  ChilldModelcategory({required this.id, required this.name});
  factory ChilldModelcategory.fromJson(Map<String, dynamic> json) =>
      ChilldModelcategory(
        id: json['id'],
        name: json['name'],
      );
}
