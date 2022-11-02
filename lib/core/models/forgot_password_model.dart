import 'dart:convert';

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) =>
    ForgotPasswordResponse.fromJson(json.decode(str));

class ForgotPasswordResponse {
  ForgotPasswordResponse({
    this.message,
    this.data,
  });

  String? message;
  dynamic data;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponse(
        message: json["message"],
        data: json["data"],
      );
}
