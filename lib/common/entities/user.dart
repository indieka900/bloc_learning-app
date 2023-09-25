// To parse this JSON data, do
//
//     final loginRequestEntity = loginRequestEntityFromJson(jsonString);

import 'dart:convert';

LoginRequestEntity loginRequestEntityFromJson(String str) => LoginRequestEntity.fromJson(json.decode(str));

String loginRequestEntityToJson(LoginRequestEntity data) => json.encode(data.toJson());

class LoginRequestEntity {
    String? email;
    String? password;
    String? fullName;
    String? avatar;

    LoginRequestEntity({
        this.email,
        this.password,
        this.fullName,
        this.avatar,
    });

    factory LoginRequestEntity.fromJson(Map<String, dynamic> json) => LoginRequestEntity(
        email: json["email"],
        password: json["password"],
        fullName: json["full_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "full_name": fullName,
        "avatar": avatar,
    };
}
