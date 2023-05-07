/*
/// id : 15
/// type : "Home"
/// name : "ddddd"
/// country : "Yemen"
/// city : "Sana'a"
/// phone_number : "96733333"
/// address : "ddddd"
/// description : "dsdfsadfsadf"
/// log : "-122.084"
/// lut : "37.4219983"

class Data {
  Data({
      this.id, 
      this.type, 
      this.name, 
      this.country, 
      this.city, 
      this.phoneNumber, 
      this.address, 
      this.description, 
      this.log, 
      this.lut,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    country = json['country'];
    city = json['city'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    description = json['description'];
    log = json['log'];
    lut = json['lut'];
  }
  int id;
  String type;
  String name;
  String country;
  String city;
  String phoneNumber;
  String address;
  String description;
  String log;
  String lut;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['name'] = name;
    map['country'] = country;
    map['city'] = city;
    map['phone_number'] = phoneNumber;
    map['address'] = address;
    map['description'] = description;
    map['log'] = log;
    map['lut'] = lut;
    return map;
  }

}*/
