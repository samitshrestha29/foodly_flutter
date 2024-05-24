import 'dart:convert';

SucessModel successModelFromJson(String str) =>
    SucessModel.fromJson(json.decode(str));

String successModelToJson(SucessModel data) => json.encode(data.toJson());

class SucessModel {
  final bool status;
  final String message;

  SucessModel({
    required this.status,
    required this.message,
  });

  factory SucessModel.fromJson(Map<String, dynamic> json) => SucessModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
