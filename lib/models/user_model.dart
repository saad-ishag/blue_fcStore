// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserModel {
  UserModel({
    required this.responseCode,
    required this.responseStatus,
    required this.responseMessage,
  //  required this.data,
  });

  final int responseCode;
  final String responseStatus;
  final String responseMessage;
  //final Data data;

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

 // String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    responseCode: json["ResponseCode"],
    responseStatus: json["ResponseStatus"],
    responseMessage: json["ResponseMessage"],
    //data: Data.fromJson(json["data"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "ResponseCode": responseCode,
  //   "ResponseStatus": responseStatus,
  //   "ResponseMessage": responseMessage,
  //   "data": data.toJson(),
  // };
}

class Data {
  Data({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  //factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  // factory Data.fromJson(Map<String, dynamic> json) => Data(
  //   user: User.fromJson(json["user"]),
  //   token: json["token"],
  // );

  // Map<String, dynamic> toJson() => {
  //   "user": user.toJson(),
  //   "token": token,
  // };
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.emailVerifiedAt,
    required this.image,
    required this.flag,
      });

  final int id;
  final String firstName;
  final dynamic lastName;
  final String phoneNumber;
  final String email;
  final dynamic emailVerifiedAt;
  final String image;
  final String flag;
    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  //String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneNumber: json["phone_number"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    image: json["image"],
    flag: json["flag"],
    );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "first_name": firstName,
  //   "last_name": lastName,
  //   "phone_number": phoneNumber,
  //   "email": email,
  //   "email_verified_at": emailVerifiedAt,
  //   "image": image,
  //   "flag": flag,
  //   };
}

