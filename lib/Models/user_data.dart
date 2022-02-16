// To parse required this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    required this.status,
    required this.obj,
  });

  String status;
  Obj obj;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
    required this.id,
    required this.stdid,
    required this.name,
    required this.fname,
    required this.email,
    required this.cnic,
    required this.phone,
    required this.faculty,
    required this.slot,
    required this.days,
    required this.program,
    required this.address,
    required this.currentsemester,
    required this.batchcode,
    required this.password,
    required this.image,
    required this.totalAttendence,
    required this.totalLeave,
    required this.totalAbsent,
    required this.point,
  });

  String id;
  String stdid;
  String name;
  String fname;
  String email;
  String cnic;
  String phone;
  String faculty;
  String slot;
  String days;
  String program;
  String address;
  String currentsemester;
  String batchcode;
  String password;
  String image;
  String totalAttendence;
  String totalLeave;
  String totalAbsent;
  String point;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    id: json["id"],
    stdid: json["stdid"],
    name: json["name"],
    fname: json["fname"],
    email: json["email"],
    cnic: json["cnic"],
    phone: json["phone"],
    faculty: json["faculty"],
    slot: json["slot"],
    days: json["days"],
    program: json["program"],
    address: json["address"],
    currentsemester: json["currentsemester"],
    batchcode: json["batchcode"],
    password: json["password"],
    image: json["image"],
    totalAttendence: json["total_attendence"],
    totalLeave: json["total_leave"],
    totalAbsent: json["total_absent"],
    point: json["point"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stdid": stdid,
    "name": name,
    "fname": fname,
    "email": email,
    "cnic": cnic,
    "phone": phone,
    "faculty": faculty,
    "slot": slot,
    "days": days,
    "program": program,
    "address": address,
    "currentsemester": currentsemester,
    "batchcode": batchcode,
    "password": password,
    "image": image,
    "total_attendence": totalAttendence,
    "total_leave": totalLeave,
    "total_absent": totalAbsent,
    "point": point,
  };
}
