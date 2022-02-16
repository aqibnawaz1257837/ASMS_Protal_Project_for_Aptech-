// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  LoginData({
 required    this.status,
    required  this.obj,
  });

  String status;
  Obj obj;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    status: json["status"],
    obj: Obj.fromJson(json["obj"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "obj": obj.toJson(),
  };
}

class Obj {
  Obj({
    required  this.stdid,
  });

  String stdid;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    stdid: json["stdid"],
  );

  Map<String, dynamic> toJson() => {
    "stdid": stdid,
  };
}
