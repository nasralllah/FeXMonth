class myAddressModel{
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

  myAddressModel({required this.id,required this.type,required this.name,required this.country,required this.city,
    required this.phone_number, required this.address,required this.description,required this.log,required this.lut});
  factory myAddressModel.fromjson(Map<String,dynamic> json)=>
      myAddressModel(
          id: json['id'],
          type: json['type'],
          name: json['name'],
          country: json['country'],
          city: json['city'],
          phone_number: json['phone_number'],
          address: json['address'],
          description: json['description'],
          log: json['log'],
          lut: json['lut']
      );

}