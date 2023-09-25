// To parse this JSON data, do
//
//     final loginRequestEntity = loginRequestEntityFromJson(jsonString);

import 'dart:convert';

//LoginRequestEntity loginRequestEntityFromJson(String str) => LoginRequestEntity.fromJson(json.decode(str));

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

    // factory LoginRequestEntity.fromJson(Map<String, dynamic> json) => LoginRequestEntity(
    //     email: json["email"],
    //     password: json["password"],
    //     fullName: json["full_name"],
    //     avatar: json["avatar"],
    // );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "full_name": fullName,
        "avatar": avatar,
    };
}

// To parse this JSON data, do
//
//     final userLoginResponseEntity = userLoginResponseEntityFromJson(jsonString);



UserLoginResponseEntity userLoginResponseEntityFromJson(String str) => UserLoginResponseEntity.fromJson(json.decode(str));

//String userLoginResponseEntityToJson(UserLoginResponseEntity data) => json.encode(data.toJson());

class UserLoginResponseEntity {
    bool? status;
    String? message;
    String? token;
    User? user;

    UserLoginResponseEntity({
        this.status,
        this.message,
        this.token,
         this.user,
    });

    factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) => UserLoginResponseEntity(
        status: json["Status"],
        message: json["message"],
        token: json["token"],
        user: User.fromJson(json["user"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "Status": status,
    //     "message": message,
    //     "token": token,
    //     "user": user?.toJson(),
    // };
}

class User {
    int? id;
    String? password;
    DateTime? lastLogin;
    bool? isSuperuser;
    String? email;
    String? fullName;
    String? phoneNumber;
    String? avatar;
    bool? isActive;
    bool? isStaff;
    DateTime? dateJoined;

    User({
        this.id,
        this.password,
        this.lastLogin,
        this.isSuperuser,
        this.email,
        this.fullName,
        this.phoneNumber,
        this.avatar,
        this.isActive,
        this.isStaff,
        this.dateJoined,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        email: json["email"],
        fullName: json["full_name"],
        phoneNumber: json["phone_number"],
        avatar: json["avatar"],
        isActive: json["is_active"],
        isStaff: json["is_staff"],
        dateJoined: DateTime.parse(json["date_joined"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin?.toIso8601String(),
        "is_superuser": isSuperuser,
        "email": email,
        "full_name": fullName,
        "phone_number": phoneNumber,
        "avatar": avatar,
        "is_active": isActive,
        "is_staff": isStaff,
        "date_joined": dateJoined?.toIso8601String(),
    };
}

