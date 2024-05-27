import 'dart:convert';

// Functions to convert JSON string to LoginResponse object and vice versa
LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String id;
  final String username;
  final String email;
  final String fcm;
  final bool phoneverification;
  final String phone;
  final bool verification;
  final String userType;
  final String profile;
  final String userToken;

  // Constructor with required named parameters
  LoginResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.fcm,
    required this.phoneverification,
    required this.phone,
    required this.verification,
    required this.userType,
    required this.profile,
    required this.userToken,
  });

  // Factory constructor to create LoginResponse from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"] ?? '',
        username: json["username"] ?? '',
        email: json["email"] ?? '',
        fcm: json["fcm"] ?? '',
        phoneverification: json["phoneverification"] ?? false,
        phone: json["phone"] ?? '',
        verification: json["verification"] ?? false,
        userType: json["userType"] ?? '',
        profile: json["profile"] ?? '',
        userToken: json["userToken"] ?? '',
      );

  // Method to convert LoginResponse object to JSON
  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "fcm": fcm,
        "phoneverification": phoneverification,
        "phone": phone,
        "verification": verification,
        "userType": userType,
        "profile": profile,
        "userToken": userToken,
      };
}
