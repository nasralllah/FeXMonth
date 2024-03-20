/*
class VefayPhoneNumberModel {
  final String status;
  final String message;
  final ChildData data;

  VefayPhoneNumberModel(
      {required this.status, required this.message, required this.data});
  factory VefayPhoneNumberModel.fromJson(Map<String, dynamic> json) =>
      VefayPhoneNumberModel(
          status: json['status'],
          message: json['message'],
          data: ChildData.fromJson(json['data']));
}

class ChildData {
  final ChildUser user;
  final String remember_token;
  final String token;

  ChildData({
    required this.user,
    required this.remember_token,
    required this.token,
  });
  factory ChildData.fromJson(Map<String, dynamic> json) => ChildData(
      user: ChildUser.fromJson(json['user']),
      remember_token: json['remember_token'],
      token: json['token']);
}

class ChildUser {
  final int id;
  final String username;
  final String name;
  final String email;
  final String email_verified_at;
  final String phone_number;
  final String phone_number_verified_at;
  final String two_factor_confirmed_at;
  final String account_type;
  final String current_team_id;
  final String profile_photo_path;
  final String updated_at;
  final String created_at;
  final String deleted_at;
  final String profile_photo_url;

  ChildUser(
      {required this.username,
      required this.name,
      required this.email,
      required this.phone_number,
      required this.updated_at,
      required this.created_at,
      required this.id,
      required this.profile_photo_url,
      required this.account_type,
      required this.current_team_id,
      required this.deleted_at,
      required this.email_verified_at,
      required this.phone_number_verified_at,
      required this.profile_photo_path,
      required this.two_factor_confirmed_at});

  factory ChildUser.fromJson(Map<String, dynamic> json) => ChildUser(
      username: json['username'],
      name: json['name'],
      email: json['email'],
      phone_number: json['phone_number'],
      updated_at: json['updated_at'],
      created_at: json['created_at'],
      id: json['id'],
      profile_photo_url: json['profile_photo_url'],
      account_type: json['account_type'],
      current_team_id:json['current_team_id'],
      deleted_at: json['deleted_at'],
      email_verified_at: json['email_verified_at'],
      phone_number_verified_at:json['phone_number_verified_at'],
      profile_photo_path: json['profile_photo_path'],
      two_factor_confirmed_at: json['two_factor_confirmed_at']);
}
*/
class VefayPhoneNumberModel {
  final String? status;
  final dynamic message;
  final Data? data;

  VefayPhoneNumberModel({
    this.status,
    this.message,
    this.data,
  });

}

class Data {
  final User? user;
  final String? rememberToken;
  final String? token;

  Data({
    this.user,
    this.rememberToken,
    this.token,
  });

}

class User {
  final int? id;
  final String? username;
  final String? name;
  final String? email;
  final DateTime? emailVerifiedAt;
  final String? phoneNumber;
  final dynamic phoneNumberVerifiedAt;
  final dynamic twoFactorConfirmedAt;
  final String? accountType;
  final dynamic currentTeamId;
  final dynamic profilePhotoPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? profilePhotoUrl;

  User({
    this.id,
    this.username,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.phoneNumberVerifiedAt,
    this.twoFactorConfirmedAt,
    this.accountType,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.profilePhotoUrl,
  });

}
