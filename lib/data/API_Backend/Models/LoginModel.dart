class LoginModel {
  final String status;
  final String message;
  final ChildData1 data;

  LoginModel(
      {required this.status, required this.message, required this.data});
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
          status: json['status'],
          message: json['message'],
          data: ChildData1.fromJson(json['data']));
}

class ChildData1 {
  final ChildUser1 user;
  final String remember_token;
  final String token;

  ChildData1({
    required this.user,
    required this.remember_token,
    required this.token,
  });
  factory ChildData1.fromJson(Map<String, dynamic> json) => ChildData1(
      user: ChildUser1.fromJson(json['user']),
      remember_token: json['remember_token'],
      token: json['token']);
}

class ChildUser1 {
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

  ChildUser1(
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

  factory ChildUser1.fromJson(Map<String, dynamic> json) => ChildUser1(
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
