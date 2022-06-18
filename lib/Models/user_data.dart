// To parse required  this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
  required   this.status,
    required  this.obj,
  });

  String status;
  Obj obj;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    status: json["status"],
    obj: Obj.fromJson(json["obj"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "obj": obj == null ? null : obj.toJson(),
  };
}

class Obj {
  Obj({
    required  this.id,
    required  this.stdid,
    required  this.name,
    required  this.fname,
    required  this.email,
    required  this.cnic,
    required  this.phone,
    required  this.fphone,
    required  this.faculty,
    required  this.timing,
    required  this.day,
    required  this.program,
    required  this.address,
    required  this.semester,
    required  this.batch,
    required  this.image,
    required  this.totalAttendence,
    required  this.totalLeave,
    required  this.totalAbsent,
    required  this.point,
  });

  String id;
  String stdid;
  String name;
  String fname;
  String email;
  String cnic;
  String phone;
  String fphone;
  String faculty;
  String timing;
  String day;
  String program;
  String address;
  String semester;
  String batch;
  String image;
  String totalAttendence;
  String totalLeave;
  String totalAbsent;
  String point;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    id: json["id"] == null ? null : json["id"],
    stdid: json["stdid"] == null ? null : json["stdid"],
    name: json["name"] == null ? null : json["name"],
    fname: json["fname"] == null ? null : json["fname"],
    email: json["email"] == null ? null : json["email"],
    cnic: json["cnic"] == null ? null : json["cnic"],
    phone: json["phone"] == null ? null : json["phone"],
    fphone: json["fphone"] == null ? null : json["fphone"],
    faculty: json["faculty"] == null ? null : json["faculty"],
    timing: json["timing"] == null ? null : json["timing"],
    day: json["day"] == null ? null : json["day"],
    program: json["program"] == null ? null : json["program"],
    address: json["address"] == null ? null : json["address"],
    semester: json["semester"] == null ? null : json["semester"],
    batch: json["batch"] == null ? null : json["batch"],
    image: json["image"] == null ? null : json["image"],
    totalAttendence: json["total_attendence"] == null ? null : json["total_attendence"],
    totalLeave: json["total_leave"] == null ? null : json["total_leave"],
    totalAbsent: json["total_absent"] == null ? null : json["total_absent"],
    point: json["point"] == null ? null : json["point"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "stdid": stdid == null ? null : stdid,
    "name": name == null ? null : name,
    "fname": fname == null ? null : fname,
    "email": email == null ? null : email,
    "cnic": cnic == null ? null : cnic,
    "phone": phone == null ? null : phone,
    "fphone": fphone == null ? null : fphone,
    "faculty": faculty == null ? null : faculty,
    "timing": timing == null ? null : timing,
    "day": day == null ? null : day,
    "program": program == null ? null : program,
    "address": address == null ? null : address,
    "semester": semester == null ? null : semester,
    "batch": batch == null ? null : batch,
    "image": image == null ? null : image,
    "total_attendence": totalAttendence == null ? null : totalAttendence,
    "total_leave": totalLeave == null ? null : totalLeave,
    "total_absent": totalAbsent == null ? null : totalAbsent,
    "point": point == null ? null : point,
  };
}
