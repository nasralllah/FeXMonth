class CreatAccountModel{
  final String status;
  final String message;
  final ChildData data;

  CreatAccountModel({required this.status,required this.message,required this.data});
  factory CreatAccountModel.fromJson(Map<String,dynamic> json)=>
      CreatAccountModel(
          status: json['status'] ?? "",
          message: json['message'] ?? "",
          data: ChildData.fromJson(json['data'] as Map<String, dynamic>)
      );
}


class ChildData{
  final ChildUser user;
  final String remember_token;

  ChildData({required this.user,required this.remember_token});
  factory ChildData.fromJson(Map<String,dynamic> json) =>
      ChildData(
          user: ChildUser.fromJson(json['user']),
          remember_token: json['remember_token'],
      );
}

class ChildUser{
  final String username;
  final String name;
  final String email;
  final String phone_number;
  final String updated_at;
  final String created_at;
  final int id;
  final String profile_photo_url;

  ChildUser({required this.username, required this.name,required this.email,required this.phone_number,
    required this.updated_at,required this.created_at,required this.id,required this.profile_photo_url});
  factory ChildUser.fromJson(Map<String,dynamic> json)=>
      ChildUser(
          username: json['username'],
          name:  json['name'],
          email:  json['email'],
          phone_number:  json['phone_number'],
          updated_at:  json['updated_at'],
          created_at:  json['created_at'],
          id:  json['id'],
          profile_photo_url:  json['profile_photo_url']);
}
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
/*

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String status;
  dynamic message;
  Data data;

  Welcome({
    required this.status,
    this.message,
    required this.data,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  User user;
  String rememberToken;

  Data({
    required this.user,
    required this.rememberToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    rememberToken: json["remember_token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "remember_token": rememberToken,
  };
}

class User {
  String username;
  String name;
  String email;
  String phoneNumber;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String profilePhotoUrl;

  User({
    required this.username,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "profile_photo_url": profilePhotoUrl,
  };
}
*/
